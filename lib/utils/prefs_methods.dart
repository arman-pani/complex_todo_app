import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsMethods {
  static Future<void> setUserInfo(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
    await prefs.setString('Username', username);
    await prefs.setString('Password', password);
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('Username');
    return username;
  }

  static Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final password = prefs.getString('Username');
    return password;
  }

  static Future<bool?> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('isLogin');
    return isLogin;
  }

  static Future<void> removeLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLogin');
    await prefs.remove('Username');
    await prefs.remove('Password');
  }
}
