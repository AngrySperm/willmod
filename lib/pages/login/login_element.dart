import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:willmod/configs/constant.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginElement {
  static Widget getHeader(double height) {
    return Container(
      height: height * 0.2,
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  const Text("Welcome",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: colorTextDark)),
                  const Text(
                    "Back!",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: colorTextDark),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: Column(
                  children: [
                    Image.asset(logoKecil, width: 50, height: 50),
                    8.height,
                    Text(txtNamaAplikasi.replaceAll(" ", "\n"),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                            height: 1,
                            color: colorTextDark)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  static Widget getBottomBg(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.35,
      child: Image.asset(
        picBgBottomOnly,
        width: width,
        height: height * 0.35,
        fit: BoxFit.fill,
      ),
    );
  }

  static Widget getVersion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                height: 1,
                color: colorTextLight,
                margin: const EdgeInsets.only(right: 20, left: 20))),
        const Text('Version 1.0.0', style: TextStyle(color: colorTextLight)),
        Expanded(
            child: Container(
                height: 1,
                color: colorTextLight,
                margin: const EdgeInsets.only(left: 20, right: 20))),
      ],
    );
  }

  static Widget getTextFieldUserName(
      TextEditingController controller, ValueChanged<String>? onChanged) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      style: const TextStyle(
          fontSize: 16,
          color: colorTextDark,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown[50]!)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 1)),
        fillColor: Colors.brown[50],
        filled: true,
        labelText: "User Id",
        labelStyle: const TextStyle(color: colorGrey, fontSize: 16),
      ),
      onChanged: onChanged,
    );
  }

  static Widget getTextFieldPassword(
      TextEditingController controller,
      RxBool passwordVisible,
      ValueChanged<String>? onChanged,
      GestureTapCallback? onTap) {
    return TextFormField(
      controller: controller,
      // focusNode: passWordFocusNode,
      obscureText: passwordVisible.value,
      keyboardType: TextInputType.text,
      style: const TextStyle(
          fontSize: 16,
          color: colorTextDark,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5),
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: const TextStyle(color: colorGrey, fontSize: 16),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
              passwordVisible.value ? Icons.visibility : Icons.visibility_off,
              color: colorBgDark,
              size: 22),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown[50]!)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 1)),
        fillColor: Colors.brown[50],
        filled: true,
      ),
      onChanged: onChanged,
    );
  }

  static Widget getButtonLogin(VoidCallback? onPressed) {
    return SizedBox(
      width: Get.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: Colors.brown[500],
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: onPressed,
        child: const Text('LOGIN',
            style: TextStyle(
                color: colorBgLight,
                fontSize: 18,
                letterSpacing: 5,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}

// getLogo() {
//   return Container(
//     margin: const EdgeInsets.only(top: 5),
//     child: Align(
//       alignment: Alignment.topCenter,
//       child: Column( children: [
//         Image.asset(pathLogo, height: 100, width: 100),
//         8.height,
//         const Text( txtNamaAplikasi,
//             style: TextStyle(
//                 color: colorTextDark, fontSize: 24, fontWeight: FontWeight.w700))      ], ),
//     ),
//   );
// }

// getButtonSignUp(GestureTapCallback? onTap) {
//   return Align(
//     alignment: Alignment.bottomCenter,
//     child: GestureDetector(
//       onTap: onTap,
//       child: const Text.rich(
//         TextSpan(
//           text: "You don't have an account! ",
//           style: TextStyle(color: appTextColorSecondary),
//           children: <TextSpan>[
//             TextSpan(
//                 text: 'Sign Up',
//                 style: TextStyle(color: Colors.green)),
//           ],
//         ),
//       ),
//     ),
//   );
// }