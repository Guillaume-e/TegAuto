import 'dart:developer' as developer;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _name = "";
  String _email = "";
  bool _isAdmin = false;
  String _image = "";

  void setName(String newName) {
    _name = newName;
    // notifyListeners();
  }

  void setEmail(String newEmail) {
    _email = newEmail;
    // notifyListeners();
  }

  void setAdminStatus(bool adminStatus) {
    _isAdmin = adminStatus;
    // notifyListeners();
  }

  void setImage(String newImage) {
    _image = newImage;
    // notifyListeners();
  }

  String getEmail() {
    return _email;
  }

  String getName() {
    return _name;
  }

  String getImagePath() {
    return _image;
  }

  bool getIsAdminStatus() {
    return _isAdmin;
  }

  Future<bool> registerNewUser(
    String username,
    String email,
    String password,
  ) async {
    if (email.isEmpty == true || password.isEmpty == true) {
      return false;
    }
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginExistingUser(String email, String password) async {
    try {
      if (email.isEmpty == true || password.isEmpty == true) return false;
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      developer.log("CREDENTIAL");
      print(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      developer.log("EXCEPTION");
      if (e.code == 'user-not-found') {
        developer.log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        developer.log('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        developer.log('Wrong email');
      }
      return false;
    } catch (error) {
      return false;
    }
  }
}
