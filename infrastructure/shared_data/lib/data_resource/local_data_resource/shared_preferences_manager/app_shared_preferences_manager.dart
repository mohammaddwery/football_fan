import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'shared_preferences_manager.dart';

class AppSharedPreferencesManager with SharedPreferencesManager {
  final SharedPreferences _preferences;
  AppSharedPreferencesManager({required preferences,}): _preferences = preferences;

  @override
  Future<bool> delete(key) async {
    return await _preferences.remove(key);
  }

  @override
  dynamic fetchDecodedJson(String key) {
    final String? prefsData = _preferences.getString(key);
    if (prefsData == null || prefsData == 'null') throw const FormatException('Not Found');
    return json.decode(prefsData);
  }

  @override
  String fetchString(String key) {
    final String? prefsData = _preferences.getString(key);
    if (prefsData == null || prefsData == 'null') throw const FormatException('Not Found');
    return prefsData;
  }

  @override
  bool isExist(String key) {
    final String? prefsData = _preferences.getString(key);
    return (prefsData != null && prefsData != 'null');
  }

  @override
  Future<bool> save(String key, String data) async {
    return await _preferences.setString(key, data);
  }

  @override
  Future<bool> clearCache() async {
    return await _preferences.clear();
  }

  @override
  Future<bool> saveBool (String key, bool data) async {
    return await _preferences.setBool(key, data);
  }

  @override
  bool fetchBool(String key) {
    bool? prefsData = _preferences.getBool(key);
    prefsData ??= true;
    return prefsData;
  }

}