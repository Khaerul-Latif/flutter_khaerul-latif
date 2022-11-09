import 'package:flutter/widgets.dart';
import 'package:mini_project/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveUserCache {
  static SharedPreferences? _preferences;

  static Future initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveUser(String user) async {
    await initPreferences();
    final result = await _preferences!.setString('user', user);
    if (!result) {
      return false;
    }
    return true;
  }

  static Future<String?> getUser() async {
    await initPreferences();
    String? user = _preferences!.getString('user');
    return user;
  }
}
