import 'package:flutter/material.dart';

import '../../../core/data/preferences.dart';

class DashboardViewModel extends ChangeNotifier {
  int currentIndex = 0;
  bool _isDark = false;
  DashboardViewModel() {
    getPreferences();
  }

  set currentIndexSetter(int value) {
    currentIndex = value;
    notifyListeners();
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    Preferences().setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await Preferences().getTheme();
    notifyListeners();
  }

  void changeTheme() {
    isDark = !isDark;
  }
}
