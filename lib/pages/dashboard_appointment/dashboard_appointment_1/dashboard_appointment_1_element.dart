import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willmod/configs/constant.dart';

class WiljosDashboardAppointment1Element {
  static DateFormat timeFormat = DateFormat('HH:mm');

  static Widget listViewItemTodayAppointment(double screenWidth,
      Map<String, dynamic> appointment, Function(Map<String, dynamic>) onTap) {
    WiljosConstant constant = Get.put(WiljosConstant());
    double sidePadding = 20;
    double verticalPadding = 20;
    double sidePaddingInner = sidePadding * 1.5;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          sidePadding, verticalPadding / 2, sidePadding, verticalPadding / 2),
      child: Material(
        elevation: 5,
        child: InkWell(
          onTap: () {
            onTap(appointment);
          },
          splashColor: constant.colorPrimary,
          child: Container(
            width: screenWidth - sidePadding * 2 - sidePaddingInner * 2,
            padding:
                EdgeInsets.fromLTRB(sidePaddingInner, 10, sidePaddingInner, 10),
            child: Row(
              children: [
                SizedBox(
                    width: 85,
                    child: Text(
                        appointment['time'] == null
                            ? ''
                            : timeFormat.format(appointment['time']),
                        style: TextStyle(
                            color: constant.colorTextLight,
                            fontSize: 28,
                            fontWeight: FontWeight.w600))),
                15.width,
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${appointment['client_code']} - ${appointment['client_name']}",
                              style: TextStyle(
                                  color: constant.colorTextLight,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          Text("${appointment['bc_name']}",
                              style: TextStyle(
                                  color: constant.colorPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        ]),
                    5.height,
                    Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Text("Phone",
                                style: TextStyle(
                                    color: constant.colorPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600))),
                        15.width,
                        Text(appointment['client_phone'] ?? "",
                            style: TextStyle(
                                color: constant.colorTextLight,
                                fontSize: 18,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Text("Product",
                              style: TextStyle(
                                  color: constant.colorPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        15.width,
                        Expanded(
                            child: Text(appointment['product'],
                                maxLines: 3,
                                style: TextStyle(
                                    color: constant.colorTextLight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Text("Notes",
                              style: TextStyle(
                                  color: constant.colorPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        15.width,
                        Expanded(
                            child: Text(appointment['description'] ?? "",
                                maxLines: 3,
                                style: TextStyle(
                                    color: constant.colorTextLight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)))
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget listViewItemDoneAppointment(double screenWidth,
      Map<String, dynamic> appointment, Function(Map<String, dynamic>) onTap) {
    WiljosConstant constant = Get.put(WiljosConstant());
    double sidePadding = 20;
    double verticalPadding = 20;
    double sidePaddingInner = sidePadding * 1.5;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          sidePadding, verticalPadding / 2, sidePadding, verticalPadding / 2),
      child: Material(
        elevation: 5,
        child: InkWell(
          onTap: () {
            onTap(appointment);
          },
          splashColor: constant.colorPrimary,
          child: Container(
            width: screenWidth - sidePadding * 2 - sidePaddingInner * 2,
            padding:
                EdgeInsets.fromLTRB(sidePaddingInner, 10, sidePaddingInner, 10),
            child: Row(
              children: [
                SizedBox(
                    width: 85,
                    child: Text(
                        appointment['time'] == null
                            ? ''
                            : timeFormat.format(appointment['time']),
                        style: TextStyle(
                            color: constant.colorTextLight,
                            fontSize: 28,
                            fontWeight: FontWeight.w600))),
                15.width,
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${appointment['client_code']} - ${appointment['client_name']}",
                              style: TextStyle(
                                  color: constant.colorTextLight,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          Text("${appointment['bc_name']}",
                              style: TextStyle(
                                  color: constant.colorPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        ]),
                    5.height,
                    Row(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Text("Phone",
                                style: TextStyle(
                                    color: constant.colorPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600))),
                        15.width,
                        Text(appointment['client_phone'] ?? "",
                            style: TextStyle(
                                color: constant.colorTextLight,
                                fontSize: 18,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Text("Product",
                              style: TextStyle(
                                  color: constant.colorPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        15.width,
                        Expanded(
                            child: Text(appointment['product'],
                                maxLines: 3,
                                style: TextStyle(
                                    color: constant.colorTextLight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Text("Notes",
                              style: TextStyle(
                                  color: constant.colorPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        15.width,
                        Expanded(
                            child: Text(appointment['description'] ?? "",
                                maxLines: 3,
                                style: TextStyle(
                                    color: constant.colorTextLight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)))
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
