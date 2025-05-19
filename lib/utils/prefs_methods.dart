import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsMethods {
  static Future<void> setIsLogin(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', isLogin);
  }

  static Future<bool?> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('isLogin');
    return isLogin;
  }

  static Future<void> removeIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLogin');
  }
}
