import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  /**
 * singleton pattern is used here since the instance is used all over the application
 *  for memory optimization purposes   
 **/
  static final Preferences _instance = Preferences._internal();
  factory Preferences() {
    return _instance;
  }

  Preferences._internal() {}

  void setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("theme_key", value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("theme_key") ?? false;
  }
}
