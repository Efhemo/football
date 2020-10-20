import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {

  static Future<SharedPreferences> _pref() async => await SharedPreferences.getInstance();

  get theme => _pref().then((value) => value.getString(_THEME_MODE));
  Future<bool> setTheme(String themeValue) {
    return _pref().then((value) => value.setString(_THEME_MODE, themeValue));
  }

  static setBool(String key, bool value) async {
    final pref = await _pref();
    pref.setBool(key, value);
  }

  static Future<bool> getBoolean(String key) async {
    final pref = await _pref();
    return pref.getBool(key) ?? false;
  }

  static setString(String key, String value) async {
    final pref = await _pref();
    pref.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final pref = await _pref();
    return pref.getString(key) ?? "";
  }

  static const _THEME_MODE = "theme_mode";
  static const HAS_BOARDED = "has_boarded";

}