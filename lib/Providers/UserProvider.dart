import 'package:flutter/material.dart';
import 'package:handysub/Models/UserModel.dart';

class UserProvider with ChangeNotifier {
  User _user = User("", "", "", true, true, "", 0);

  getUserData() {
    return _user;
  }

  setUserData(User user) {
    _user.email = user.email;
    _user.password = user.password;
    _user.nickname = user.nickname;
    _user.sex = user.sex;
    _user.handicapped = user.handicapped;
    _user.info = user.info;
    _user.cookies = user.cookies;
    notifyListeners();
  }

  Map<String, dynamic> signUpUserData() {
    return {
      if (_user.email != null) "email": _user.email,
      if (_user.password != null) "password": _user.password,
      if (_user.nickname != null) "nickname": _user.nickname,
      if (_user.sex != null) "sex": _user.sex,
      if (_user.handicapped != null) "handicapped": _user.handicapped,
      if (_user.cookies != null) "cookies": _user.cookies,
      if (_user.info != null) "info": _user.info else "info": "",
    };
  }
}
