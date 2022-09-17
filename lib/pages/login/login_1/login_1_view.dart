import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:willmod/configs/constant.dart';
import 'package:willmod/pages/login/login_1/login_1_element.dart';
import 'package:willmod/pages/login/login_controller.dart';

/**
 *   pubspec.yaml
 *     local_auth: 2.1.0
 *  
 *   AndroidManifest.xml
 *     <uses-permission android:name="android.permission.USE_FINGERPRINT"/>
 *     <uses-permission android:name="android.permission.INTERNET"/>
 *     <application android:usesCleartextTraffic="true">
 *
 *   android/app/src/main/kotlin/[package]/MainActivity.kt
 *     class MainActivity: FragmentActivity() {}
 */

class WiljosLogin1View extends StatelessWidget {
  String? welcomeLabel;
  String? backgroundImage;
  bool mobile = false;

  WiljosLogin1View(
      {required this.welcomeLabel,
      required this.backgroundImage,
      this.mobile = false});

  @override
  Widget build(BuildContext context) {
    WiljosLoginController con = getController();
    WiljosConstant constant = Get.put(WiljosConstant());

    setStatusBarColor(Colors.transparent);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
            ),
            Image.asset(backgroundImage!,
                width: width,
                height: mobile ? height / 2.5 : height / 2,
                fit: BoxFit.cover),
            Positioned(
              top: mobile ? (height / 2.5) : (height / 2),
              child: Material(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.fromLTRB(width / 10, 0, width / 10, 0),
                  width: width,
                  height: mobile ? (height - height / 2.5) : (height / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height / 17),
                      Text(constant.txtNamaAplikasi.toUpperCase(),
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: constant.colorPrimary)),
                      5.height,
                      Text(welcomeLabel!,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: constant.colorText)),
                      SizedBox(height: height / 22),
                      WiljosLogin1Element.textFieldId(
                          con.phoneCon, con.phoneFocusNode, (text) {
                        con.userId = text;
                      }),
                      SizedBox(height: height / 30),
                      WiljosLogin1Element.textFieldPassword(con.passwordCon,
                          con.passwordFocusNode, con.passwordVisible, (text) {
                        con.password = text;
                      }),
                      SizedBox(
                        height: mobile ? (height / 6) : (height / 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WiljosLogin1Element.buttonFingerPrint(() {
                              con.biometricAuthentication();
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: mobile ? (height / 2.5 - 80 / 2) : (height / 2 - 80 / 2),
                left: width / 1.6,
                child: WiljosLogin1Element.buttonLogin(() {
                  con.login(() {
                    con.userId = "";
                    con.password = "";
                    con.phoneCon.text = "";
                    con.passwordCon.text = "";
                  });
                })),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: WiljosLogin1Element.textVersion("v 1.0.0")),
            getTopLayer()
          ],
        ),
      ),
    );
  }

  // methods to overwrite

  WiljosLoginController getController() {
    WiljosLoginController controller = Get.put(WiljosLoginController());
    return controller;
  }

  Widget getTopLayer() {
    return const SizedBox();
  }
}
