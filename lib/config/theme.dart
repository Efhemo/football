import 'package:football/utils/storage_util.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';

class AppTheme extends IThemeModeManager with StorageUtil {

  @override
  Future<String> loadThemeMode() async {
    return theme;
  }

  @override
  Future<bool> saveThemeMode(String value) async {
    return setTheme(value);
  }

}