import 'package:football/utils/storage_util.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';

class AppTheme extends IThemeModeManager {

  final storage = StorageUtil();

  @override
  Future<String> loadThemeMode() async {
    //final _prefs = await SharedPreferences.getInstance();
    //return _prefs.getString(_key);
    return storage.theme;
  }

  @override
  Future<bool> saveThemeMode(String value) async {
    //final _prefs = await SharedPreferences.getInstance();
    //return _prefs.setString(_key, value);
    return storage.setTheme(value);
  }

}