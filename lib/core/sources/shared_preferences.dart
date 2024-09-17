import 'package:shared_preferences/shared_preferences.dart';

class AppSp {
  AppSp._();
  static late SharedPreferences _sp;

  static Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static Future<bool> clear() async {
    return await _sp.clear();
  }

  static Future<bool> setString({required String key, required String value}) async {
    return await _sp.setString(key, value);
  }

  static Future<bool> setInt({required String key, required int value}) async {
    return await _sp.setInt(key, value);
  }

  static Future<bool> setDouble({required String key, required double value}) async =>
      await _sp.setDouble(key, value);

  static Future<bool> setBool({required String key, required bool value}) async {
    return await _sp.setBool(key, value);
  }

  static String getString(String key) => _sp.getString(key) ?? "";

  static int? getInt(String key) => _sp.getInt(key);
  static double? getDouble(String key) => _sp.getDouble(key);

  static bool getBool(String key) => _sp.getBool(key) ?? false;
}

abstract class SPVars {
  static const loggedIn = "wxasd1";
  static const profilePictureUrl = "fdscssa2";
  static const userName = "cdsdc3";
  static const videoMoveValue = "asdsad4";
  static const videoPlaySpeed = "dasasdc5";
  static const sawWelcomeScreen = "dasasasdc5";
}
