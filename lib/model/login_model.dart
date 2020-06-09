import 'package:flutter/foundation.dart';

class LoginModel with ChangeNotifier {
  String username;
  String token;

  LoginModel({this.username, this.token});
  void setLogins(String username, String token) {
    this.username = username;
    this.token = token;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "token": token};
  }
}
