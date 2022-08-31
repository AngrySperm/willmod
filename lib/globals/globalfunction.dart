import 'dart:math';

import 'package:willmod/configs/constant.dart';
import 'package:willmod/configs/myapp.dart';

String getPicDummy() {
  Random rnd = Random();
  return "?dummy=${rnd.nextInt(1000)}";
}
