import 'dart:math';

import 'package:willmod/configs/constant.dart';
import 'package:willmod/configs/myapp.dart';

String getPicDummy() {
  Random rnd = Random();
  return "?dummy=${rnd.nextInt(1000)}";
}

String getLogoPerusahaan(int perusahaan) {
  String txt = "";
  switch (perusahaan) {
    case MyApp.EXPORT:
      txt = logoExport;
      break;
    case MyApp.LOKAL:
      txt = logoLokal;
      break;
    case MyApp.WP:
      txt = logoWP;
      break;
    case MyApp.PSI:
      txt = logoPSI;
      break;
    case MyApp.PCP:
      txt = logoPCP;
      break;
    case MyApp.SSU:
      txt = logoSSU;
      break;
  }
  return txt;
}
