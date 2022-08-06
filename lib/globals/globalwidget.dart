import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:willmod/configs/constant.dart';
import 'package:nb_utils/nb_utils.dart';

showMessage(String message, {int type = 0}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: const Duration(seconds: 2),
  ));
}

Future<bool> showConfirm(BuildContext context, String header, String message,
    String cancelTxt, String okTxt, VoidCallback onConfirm) async {
  bool? res = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentTextStyle: TextStyle(color: appTextColorSecondary),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(header,
              style: TextStyle(fontSize: 16, color: appTextColorPrimary)),
          content: Text(message,
              style: TextStyle(fontSize: 14, color: appTextColorSecondary)),
          actions: <Widget>[
            TextButton(
              child: Text(cancelTxt,
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              child: Text(okTxt,
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
              onPressed: () {
                onConfirm();
              },
            ),
          ],
        );
      });
  return res!;
}
