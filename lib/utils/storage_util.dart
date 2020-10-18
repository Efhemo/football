import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {

  Future<SharedPreferences> _pref() async => await SharedPreferences.getInstance();

  get theme => _pref().then((value) => value.getString(_THEME_MODE));
  Future<bool> setTheme(String themeValue) {
    return _pref().then((value) => value.setString(_THEME_MODE, themeValue));
  }

  static const _THEME_MODE = "theme_mode";

}