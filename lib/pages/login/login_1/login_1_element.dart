import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willmod/configs/constant.dart';

class WiljosLogin1Element {
  static Widget imageCarousel(
      bool isLoading, double width, double height, List<String> images) {
    return Container();
  }

  static Widget textButton(
      String text, Color color, Color splashColor, VoidCallback onOk) {
    return InkWell(
      splashColor: splashColor,
      onTap: () {
        onOk();
      },
      child: Text(text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: color)),
    );
  }

  static Widget textFieldId(TextEditingController controller, FocusNode focus,
      ValueChanged<String>? onChanged) {
    WiljosConstant constant = Get.put(WiljosConstant());

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      // focusNode: focus,
      // autofocus: true,
      textInputAction: TextInputAction.next,
      style: TextStyle(
          color: constant.colorText, fontWeight: FontWeight.w600, fontSize: 18),
      decoration: InputDecoration(
        hintText: "User ID",
        hintStyle: TextStyle(color: constant.colorTextLighter),
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: constant.colorPrimary[500]!, width: 1)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: constant.colorPrimary, width: 1.8)),
      ),
      onChanged: (text) {
        if (onChanged != null) onChanged(text);
      },
    );
  }

  static Widget textFieldPassword(TextEditingController controller,
      FocusNode focus, RxBool showPassword, ValueChanged<String>? onChanged) {
    WiljosConstant constant = Get.put(WiljosConstant());
    return Obx(() => TextFormField(
          controller: controller,
          // focusNode: focus,
          obscureText: !(showPassword.value),
          keyboardType: TextInputType.text,
          style: TextStyle(
              color: constant.colorText,
              fontWeight: FontWeight.w600,
              fontSize: 18),
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: constant.colorTextLighter),
            suffixIcon: GestureDetector(
              onTap: () {
                showPassword.value = !(showPassword.value);
              },
              child: Icon(
                  showPassword.value ? Icons.visibility : Icons.visibility_off,
                  color: constant.colorPrimary,
                  size: 20),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: constant.colorPrimary[500]!, width: 1)),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: constant.colorPrimary, width: 1.8)),
          ),
          onChanged: (text) {
            if (onChanged != null) onChanged(text);
          },
        ));
  }

  static Widget buttonLogin(VoidCallback onOk) {
    WiljosConstant constant = Get.put(WiljosConstant());
    return Material(
      elevation: 1,
      color: constant.colorPrimary[500]!,
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: InkWell(
        onTap: () {
          onOk();
        },
        splashColor: constant.colorPrimary[500]!,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Container(
            padding: const EdgeInsets.fromLTRB(26, 26, 26, 26),
            width: 80,
            height: 80,
            child: const Icon(
              Icons.west,
              size: 30,
              color: Colors.white,
            )),
      ),
    );
  }

  static Widget textVersion(String versionTxt) {
    WiljosConstant constant = Get.put(WiljosConstant());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "- ${versionTxt} -",
          style: TextStyle(
              color: constant.colorTextLighter,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        )
      ],
    );
  }

  static Widget buttonFingerPrint(VoidCallback onOk) {
    WiljosConstant constant = Get.put(WiljosConstant());
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: () {
          onOk();
        },
        splashColor: constant.colorPrimary[500]!,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: const SizedBox(
          width: 55,
          height: 65,
          child: Icon(
            Icons.fingerprint,
            color: Colors.grey,
            size: 55,
          ),
        ),
      ),
    );
  }
}
