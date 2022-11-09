import 'package:flutter/cupertino.dart';
import 'package:mini_project/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel();

  UserModel get user => _user;

  set user(UserModel userModel) {
    _user = userModel;
    notifyListeners();
  }
}