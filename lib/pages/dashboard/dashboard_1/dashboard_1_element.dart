import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willmod/configs/constant.dart';

class WiljosDashboard1Element {
  static BottomNavigationBarItem bottomBarItemButton(
      IconData iconData, String label, Color bgColor, Color activeBgColor) {
    WiljosConstant constant = Get.put(WiljosConstant());

    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
        ),
        // icon: Material(
        //   elevation: 1,
        //   borderRadius: const BorderRadius.all(Radius.circular(50)),
        //   color: bgColor,
        //   child: Padding(
        //       padding: const EdgeInsets.all(13),
        //       // child: Image.asset(imageTxt,
        //       //     height: 21, width: 21, color: Colors.grey),
        //       child: Icon(iconData, size: 32, color: constant.colorTextLight)),
        // ),
        // activeIcon: Material(
        //   elevation: 4,
        //   borderRadius: const BorderRadius.all(Radius.circular(50)),
        //   color: activeBgColor,
        //   child: Padding(
        //     padding: const EdgeInsets.all(13),
        //     child: Icon(iconData, size: 32, color: Colors.white),
        //   ),
        // ),
        label: label);
  }
}
