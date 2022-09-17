import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:willmod/configs/constant.dart';
import 'package:willmod/configs/myapp.dart';
import 'package:willmod/globals/globalwidget.dart';
import 'package:willmod/pages/dashboard/dashboard_1/dashboard_1_controller.dart';
import 'package:willmod/pages/dashboard/dashboard_1/dashboard_1_element.dart';

class WiljosDashboard1View extends StatelessWidget {
  List<Widget>? pages;
  List<String>? labels;
  List<IconData>? icons;

  WiljosDashboard1View({this.pages, this.labels, this.icons});

  @override
  Widget build(BuildContext context) {
    WiljosDashboard1Controller con = getController();
    WiljosConstant constant = Get.put(WiljosConstant());

    setStatusBarColor(getStatusBarColor());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: WillPopScope(
      onWillPop: () async => await showConfirm(context, "Confirmation",
          "Log out from application ...", "Cancel", "Log Out", () async {
        // MyApp myApp = Get.put(MyApp());
        // await myApp.logout();
        Navigator.of(context).pop(true);
      }),
      child: Scaffold(
        drawer: getDrawer(),
        appBar: getAppBar(),
        extendBody: true,
        bottomNavigationBar: Stack(
          children: [
            (Obx(() => BottomNavigationBar(
                  elevation: 5,
                  backgroundColor: getBottomBarBackgroundColor(),
                  currentIndex: con.selectedIndex.value,
                  onTap: con.onBottomBarItemTapped,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: TextStyle(color: constant.colorPrimary),
                  selectedItemColor: constant.colorPrimary,
                  unselectedLabelStyle:
                      TextStyle(color: constant.colorTextLighter),
                  unselectedItemColor: constant.colorTextLighter,
                  selectedFontSize: 16,
                  unselectedFontSize: 12,
                  iconSize: 38,
                  items: labels!
                      .asMap()
                      .keys
                      .toList()
                      .map((index) =>
                          WiljosDashboard1Element.bottomBarItemButton(
                              icons![index],
                              labels![index],
                              constant.colorTextLighter,
                              constant.colorPrimary))
                      .toList(),
                ))),
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(child: Obx(() => pages![con.selectedIndex.value])),
      ),
    ));
  }

  // methods to overwrite

  WiljosDashboard1Controller getController() {
    WiljosDashboard1Controller controller =
        Get.put(WiljosDashboard1Controller());
    return controller;
  }

  Color? getBottomBarBackgroundColor() {
    return null;
  }

  Color getStatusBarColor() {
    return Colors.white;
  }

  PreferredSizeWidget? getAppBar() {
    return null;
  }

  Widget? getDrawer() {
    return null;
  }
}
