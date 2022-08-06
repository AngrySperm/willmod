import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willmod/pages/login/login_controller.dart';
import 'package:willmod/configs/constant.dart';
import 'package:willmod/pages/login/login_element.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController con = Get.put(LoginController());

    setStatusBarColor(Colors.brown[100]!);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorBgLight,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                color: Colors.brown[100],
                width: width,
                height: height,
                child: WaveWidget(
                  config: CustomConfig(
                    colors: [
                      Colors.brown[400]!,
                      Colors.brown[300]!,
                      Colors.brown[200]!,
                      Colors.white
                    ],
                    blur: const MaskFilter.blur(BlurStyle.solid, 1),
                    durations: [18000, 8000, 5000, 12000],
                    heightPercentages: [0.17, 0.18, 0.20, 0.22],
                  ),
                  waveAmplitude: 0,
                  size: const Size(
                    double.infinity,
                    double.infinity,
                  ),
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: LoginElement.getBottomBg(width, height * 0.9)),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [
                    15.height,
                    LoginElement.getHeader(height),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, height * 0.18, 0, 0),
                      child: Column(
                        children: [
                          15.height,
                          LoginElement.getTextFieldUserName(
                              con.phoneCon, (txt) => con.userId = txt),
                          15.height,
                          Obx(() => LoginElement.getTextFieldPassword(
                              con.passwordCon,
                              con.passwordVisible,
                              (txt) => con.passwordId = txt,
                              () => con.switchPasswordVisibility())),
                          40.height,
                          LoginElement.getButtonLogin(() => con.login(() => {}))
                        ],
                      ),
                    ),
                  ],
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 12,
                child: LoginElement.getVersion()),
          ],
        ),
      ),
    );
  }
}
