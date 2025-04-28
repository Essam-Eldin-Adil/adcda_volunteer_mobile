// ignore_for_file: file_names

import 'dart:convert';

import 'package:adcda_volunteers_mobile/core/constants/constant.dart';
import 'package:adcda_volunteers_mobile/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const languageCodeKey = "languageCodeKey";
  static const themKey = "themKey";
  static const isFinishOnBoardingKey = "isFinishOnBoardingKey";
  static const contactList = "contactList";

  static late SharedPreferences pref;

  static initPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static bool getBoolean(String key) {
    return pref.getBool(key) ?? false;
  }

  static Future<void> setBoolean(String key, bool value) async {
    await pref.setBool(key, value);
  }

  static String getString(String key) {
    return pref.getString(key) ?? "";
  }

  static Future<void> setString(String key, String value) async {
    await pref.setString(key, value);
  }

  static Future<void> setUser(UserModel userModel) async {
    await pref.setString(Constant.userData, jsonEncode(userModel.toJson()));
  }

  static Future<UserModel> getUser() async {
    var user = pref.getString(Constant.userData);
    if (user == null) return UserModel();
    return UserModel.fromJson(jsonDecode(user));
  }

  static int getInt(String key) {
    return pref.getInt(key) ?? 0;
  }

  static Future<void> setInt(String key, int value) async {
    await pref.setInt(key, value);
  }

  static Future<void> clearSharPreference() async {
    await pref.clear();
  }

  static Future<void> clearKeyData(String key) async {
    await pref.remove(key);
  }
}
