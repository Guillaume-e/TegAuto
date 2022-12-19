import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _name = "";
  String _email = "";

  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  String getEmail() {
    return _email;
  }

  String getName() {
    return _name;
  }

  bool registerNewUser(String username, String email, String password) {
    // Database function to create a user
    return false;
  }

  bool loginExistingUser(String email, String password) {
    // Database function to authenticate a user
    return false;
  }
}
