import 'dart:async';
import 'dart:collection';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:willmod/configs/myapp.dart';
import 'package:willmod/configs/mydio.dart';
import 'package:willmod/globals/globalwidget.dart';

class WiljosDashboardAppointment1Controller extends GetxController {
  RxList<Map<String, dynamic>> todayAppointments =
      RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> doneAppointments =
      RxList<Map<String, dynamic>>();

  EventController eventController = EventController();
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());

  @override
  void onInit() {
    reloadDailyAppointmentFromCloud(DateTime.now(), null);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void clearEvents() {
    List<CalendarEventData> tmps = [];
    eventController.events.forEach((event) {
      tmps.add(event);
    });
    tmps.forEach((event) {
      eventController.remove(event);
    });
  }

  void reloadDailyAppointmentFromCloud(
      DateTime? date, String? filterParams) async {
    EasyLoading.show(status: 'Loading...');

    String filterByDate = "";

    DateTime? fromDate;
    DateTime? toDate;

    if (date != null) {
      selectedDate.value = date;
      fromDate = DateTime(date.year, date.month, date.day, 0, 0, 0);
      toDate = DateTime(date.year, date.month, date.day, 23, 59, 59);

      filterByDate =
          'transaction_date:>=:${fromDate.toIso8601String()};transaction_date:<=:${toDate.toIso8601String()}';
    }

    todayAppointments.clear();
    doneAppointments.clear();
    try {
      var myDio = Get.put(MyDio());
      var myApp = Get.put(MyApp());

      final params = paramDailyAppointment();

      if (date != null) {
        params['filter'] = filterByDate;
      }

      if (filterParams != null && filterParams.isNotEmpty) {
        params['filter'] = filterParams;
      }

      final response = await myDio.request(MyDio.REQ_GET, getApiDailyUrl(),
          mapQuery: params);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = response.data;
        List listRawData = responseBody["data"];
        for (int i = 0; i < listRawData.length; i++) {
          Map<String, dynamic> mappedData =
              mapDailyAppointmentData(listRawData[i]);
          if (mappedData['finish_date'] == null) {
            todayAppointments.add(mappedData);
          } else {
            doneAppointments.add(mappedData);
          }
        }

        EasyLoading.dismiss();
      }
    } on TimeoutException catch (_) {
      showMessage("Could not connect to server");
      EasyLoading.dismiss();
    }
  }

  void reloadMonthlyAppointmentFromCloud(DateTime date) async {
    clearEvents();
    try {
      var myDio = Get.put(MyDio());
      var myApp = Get.put(MyApp());

      final params = paramMonthlyAppointment(date);
      final response = await myDio.request(MyDio.REQ_GET, getApiMonthlyUrl(),
          mapQuery: params);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = response.data;
        Map<String, dynamic> listRawData = responseBody["data"];
        List<CalendarEventData> mappedDatas =
            mapMonthlyAppointmentData(listRawData);
        eventController.addAll(mappedDatas);
      }
    } on TimeoutException catch (_) {
      showMessage("Could not connect to server");
    }
  }

  String convertToDateStr(DateTime date) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    DateTime now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return "Today";
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      return "Yesterday";
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day + 1) {
      return "Tomorrow";
    } else {
      return dateFormat.format(date);
    }
  }

  // methods to overwrite

  Map<String, dynamic> paramMonthlyAppointment(DateTime date) {
    return {
      'year': date.year,
      'month': date.month,
    };
  }

  Map<String, dynamic> paramDailyAppointment() {
    final params = {
      'take': 100,
      'page': 1,
      'order': '',
      'order_method': 'ASC',
      'with_product': 1,
      'with_customer': 1,
      'with_bc': 1,
    };

    return params;
  }

  List<CalendarEventData> mapMonthlyAppointmentData(
      Map<String, dynamic> inputData) {
    return [];
  }

  Map<String, dynamic> mapDailyAppointmentData(Map<String, dynamic> inputData) {
    Map<String, dynamic> mapResult = HashMap();
    return mapResult;
  }

  String getApiMonthlyUrl() {
    return 'appointment/total';
  }

  String getApiDailyUrl() {
    return 'appointment/data';
  }

  void onEditAppointment(Map<String, dynamic> appointment) {
    print("@ Edit Appointment");
  }

  void onAddAppointment() {
    print("@ Add Appointment");
  }

  void onSearchAppointment() {
    print("@ Search Appointment");
  }
}
