import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:willmod/configs/myapp.dart';
import 'package:willmod/configs/mydio.dart';
import 'package:willmod/globals/globalwidget.dart';
import 'package:willmod/models/appuser.dart';

class LoginController extends GetxController {
  String userId = "";

  String passwordId = "";
  RxBool passwordVisible = RxBool(true);

  TextEditingController phoneCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneCon.dispose();
    passwordCon.dispose();

    super.onClose();
  }

  switchPasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  login(VoidCallback _onSuccess) async {
    if (userId.isEmpty) {
      showMessage("User id is empty");
    } else if (passwordId.isEmpty) {
      showMessage("Password is empty");
    } else {
      try {
        EasyLoading.show(status: 'Loading...');

        var myDio = Get.put(MyDio());
        var myApp = Get.put(MyApp());

        final body = {'username': '$userId', 'password': '$passwordId'};
        final response =
            await myDio.request(MyDio.REQ_POST_NO_AUTH, "login", body: body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> data = response.data;
          var token = data['access_token'];
          var user = AppUser.fromJson(data['user']);

          myDio.successLogin(token);
          myApp.appUser = user;

          _onSuccess();
          EasyLoading.dismiss();
        } else {
          showMessage("User id and password do not match");
          EasyLoading.dismiss();
        }
      } on TimeoutException catch (_) {
        showMessage("Could not connect to server");
        EasyLoading.dismiss();
      }
    }
  }
}
