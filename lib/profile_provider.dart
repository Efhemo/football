import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier{

  var _isDarkMode = true;

  get isDarkMode => _isDarkMode;

  set isDarkMode(value) {
    _isDarkMode = value;
    notifyListeners();
  }
}