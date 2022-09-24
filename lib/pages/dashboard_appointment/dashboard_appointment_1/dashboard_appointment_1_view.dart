import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:willmod/configs/constant.dart';
import 'package:willmod/custom_widgets/month_view_components.dart';
import 'package:willmod/pages/dashboard_appointment/dashboard_appointment_1/dashboard_appointment_1_controller.dart';
import 'package:willmod/pages/dashboard_appointment/dashboard_appointment_1/dashboard_appointment_1_element.dart';

class WiljosDashboardAppointment1View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WiljosDashboardAppointment1Controller con = getController();
    WiljosConstant constant = Get.put(WiljosConstant());

    setStatusBarColor(Colors.white);

    double width = Get.width;
    double height = Get.height;

    double tabHeight = 60;
    double dateLabelWidth = 200;

    showCalendarDialog(BuildContext context) {
      DateFormat dateFormat = DateFormat('MMMM  yyyy');
      con.reloadMonthlyAppointmentFromCloud(DateTime.now());
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              backgroundColor: Colors.transparent,
              child: Container(
                width: 540,
                height: 555,
                // width: width * 0.9,
                // height: height * 0.6,
                color: Colors.white,
                child: Center(
                  child: CalendarControllerProvider(
                    controller: con.eventController,
                    child: MonthView(
                      headerBuilder: (date) => Container(
                        height: tabHeight,
                        child: Center(
                          child: Text(
                            dateFormat.format(date),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: constant.colorPrimary),
                          ),
                        ),
                      ),
                      cellBuilder: (date, events, isToday, isInMonth) =>
                          WiljosFilledCell(
                              date: date,
                              shouldHighlight: isToday,
                              backgroundColor: isInMonth
                                  ? Colors.white
                                  : const Color(0xfff0f0f0),
                              events: events,
                              onTileTap: (eventData, date) {
                                con.reloadDailyAppointmentFromCloud(date, null);
                                Get.back();
                              }),
                      cellAspectRatio: 1,
                      onCellTap: (events, date) {
                        con.reloadDailyAppointmentFromCloud(date, null);
                        Get.back();
                      },
                      onDateLongPress: (date) {
                        con.reloadDailyAppointmentFromCloud(date, null);
                        Get.back();
                      },
                      onPageChange: (date, index) {
                        con.reloadMonthlyAppointmentFromCloud(date);
                      },
                    ),
                  ),
                ),
              ),
            );
          });
    }

    Widget todayAppointment() {
      return SizedBox(
        width: width,
        height: 0,
        child: Obx(() => ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            itemCount: con.todayAppointments.length,
            itemBuilder: (item, index) {
              return WiljosDashboardAppointment1Element
                  .listViewItemTodayAppointment(
                      width,
                      con.todayAppointments[index],
                      (appointment) => con.onEditAppointment(appointment));
            })),
      );
    }

    Widget doneAppointment() {
      return SizedBox(
        width: width,
        height: 0,
        child: Obx(() => ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            itemCount: con.doneAppointments.length,
            itemBuilder: (item, index) {
              return WiljosDashboardAppointment1Element
                  .listViewItemDoneAppointment(
                      width,
                      con.doneAppointments[index],
                      (appointment) => con.onEditAppointment(appointment));
            })),
      );
    }

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: Row(
                children: [
                  20.width,
                  FloatingActionButton(
                    heroTag: "btn1",
                    onPressed: () {
                      con.onSearchAppointment();
                    },
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.search),
                  ),
                  15.width,
                  FloatingActionButton(
                    heroTag: "btn2",
                    onPressed: () {
                      con.onAddAppointment();
                    },
                    backgroundColor: constant.colorPrimary,
                    child: const Icon(Icons.add),
                  ),
                  20.width,
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height - 100,
              ),
              DefaultTabController(
                  length: 2,
                  child: SizedBox(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: width - dateLabelWidth,
                              height: tabHeight,
                              child: TabBar(
                                indicatorWeight: 3,
                                indicatorColor: constant.colorPrimary[500],
                                labelColor: constant.colorText,
                                unselectedLabelColor: constant.colorTextLighter,
                                labelStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                unselectedLabelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                tabs: const [
                                  Tab(text: "Next Appointment"),
                                  Tab(text: "Done Appoinment")
                                ],
                              )),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                            width: dateLabelWidth,
                            height: tabHeight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: constant.colorPrimary),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.calendar_today),
                                    10.width,
                                    Obx(
                                      () => Text(
                                        con.convertToDateStr(
                                            con.selectedDate.value),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ]),
                              onPressed: () {
                                showCalendarDialog(context);
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width,
                        height: height - tabHeight - 110,
                        child: TabBarView(
                          children: [todayAppointment(), doneAppointment()],
                        ),
                      )
                    ],
                  ))),
              getTopLayer()
            ],
          ),
        ),
      ),
    );
  }

  // methods to overwrite

  WiljosDashboardAppointment1Controller getController() {
    WiljosDashboardAppointment1Controller controller =
        Get.put(WiljosDashboardAppointment1Controller());
    return controller;
  }

  Widget getTopLayer() {
    return const SizedBox();
  }
}
