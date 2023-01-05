import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreference;
  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(
    @required String IsDark,
    @required bool value,
  ) async {
    return await sharedPreference.setBool(IsDark, value);
  }

  static bool getData(@required String value) {
    return sharedPreference.getBool(value);
  }
}
