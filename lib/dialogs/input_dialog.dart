import 'dart:async';

import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willmod/configs/constant.dart';
import 'package:willmod/configs/myapp.dart';
import 'package:willmod/configs/mydio.dart';
import 'package:willmod/globals/globalwidget.dart';

class WiljosInputDialog {
  static Future<dynamic?> showInputDialog(BuildContext context, double width,
      double height, String title, String prompt, dynamic initialValue,
      {isNumericInput = false, isObscure = false}) async {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = initialValue;
    WiljosConstant constant = Get.put(WiljosConstant());

    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            backgroundColor: Colors.white,
            child: SizedBox(
              width: width * 0.9,
              height: height,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: constant.colorTextLight,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 35),
                    child: Text(
                      prompt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: constant.colorTextLight,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: width * 0.7,
                    child: TextFormField(
                      controller: textEditingController,
                      keyboardType: isNumericInput
                          ? TextInputType.number
                          : TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      obscureText: isObscure,
                      style: TextStyle(
                          fontSize: 18,
                          color: constant.colorText,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5),
                    ),
                  ),
                  45.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, null);
                        },
                        splashColor: Colors.black12,
                        child: SizedBox(
                          width: 100,
                          height: 35,
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: constant.colorTextLight,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      15.width,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: constant.colorPrimary),
                        child: const Text(
                          "Okay",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.pop(context, textEditingController.text);
                        },
                      ),
                      30.width,
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
