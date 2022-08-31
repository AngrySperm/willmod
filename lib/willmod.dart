library willmod;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willmod/configs/constant.dart' as c;
import 'package:willmod/configs/myapp.dart';

class WillMod {
  static init({
    String? apiUrl,
    String? txtNamaAplikasi,
    String? picBgBottomOnly,
    String? picBgDrawer,
    String? picBgDrawerHeader,
    String? picBg,
    String? pathLogo,
    String? logo,
    String? logoKecil,
    String? logoRokok,
    MaterialColor? colorPrimary,
    MaterialColor? colorSecondary,
  }) {
    /*******************/

    MyApp myApp = Get.put(MyApp());
    myApp.apiUrl = apiUrl!;

    /*variable provider*/
    c.WiljosConstant constant = Get.put(c.WiljosConstant());

    /*text*/
    constant.txtNamaAplikasi = txtNamaAplikasi ?? constant.txtNamaAplikasi;

    /*image*/
    constant.picBgBottomOnly = picBgBottomOnly ?? constant.picBgBottomOnly;
    constant.picBgDrawer = picBgDrawer ?? constant.picBgDrawer;
    constant.picBgDrawerHeader =
        picBgDrawerHeader ?? constant.picBgDrawerHeader;
    constant.picBg = picBg ?? constant.picBg;
    constant.pathLogo = pathLogo ?? constant.pathLogo;
    constant.logo = logo ?? constant.logo;
    constant.logoKecil = logoKecil ?? constant.logoKecil;
    constant.logoRokok = logoRokok ?? constant.logoRokok;

    /*color*/
    constant.colorPrimary = colorPrimary ?? constant.colorPrimary;
    constant.colorSecondary = colorSecondary ?? constant.colorSecondary;
  }
}
