import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:willmod/models/appuser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as intl;

class MyApp {
  static const int EXPORT = 1;
  static const int LOKAL = 2;
  static const int WP = 3;
  static const int PSI = 4;
  static const int PCP = 5;
  static const int SSU = 6;

  AppUser? appUser;
  static int TIMEOUT_DURATION_SECOND = 15;
  static intl.NumberFormat NUMBER_FORMAT = intl.NumberFormat.decimalPattern();
  String apiUrl = "";

  static DateFormat TIME_FORMAT = DateFormat("HH.mm");
  static DateFormat DATE_FORMAT = DateFormat("dd/MM/yyyy");

  Future<String> getApiUrl() async {
    if (apiUrl.isEmpty) {
      await loadEnvFile();
    }
    return apiUrl;
  }

  Future<void> loadEnvFile() async {
    await dotenv.load(fileName: '.env');
    apiUrl = dotenv.get('API_URL');
  }

  int isShowAllData() {
    if (appUser!.tipeUser == 1) {
      return 1;
    }
    return 0;
  }

  int showAllData() {
    return 1;
  }

  int getBcId() {
    return appUser!.id!;
  }
}
