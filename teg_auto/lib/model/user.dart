import 'dart:developer' as developer;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teg_auto/model/user_return.dart';

class UserManagement extends ChangeNotifier {
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

  Future<bool> setupUserInformationOnRegister(
    String username,
    String email,
    UserCredential credential,
  ) async {
    try {
      final User? actualUser = credential.user;
      await actualUser?.updateDisplayName(username);
      await actualUser?.updatePhotoURL(
        "https://static.vecteezy.com/ti/vecteur-libre/p3/2275847-male-avatar-profil-icone-de-souriant-caucasien-homme-vectoriel.jpg",
      );
      _email = email;
      _name = username;
      _image =
          "https://static.vecteezy.com/ti/vecteur-libre/p3/2275847-male-avatar-profil-icone-de-souriant-caucasien-homme-vectoriel.jpg";
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<UserReturn> registerNewUser(
    String username,
    String email,
    String password,
  ) async {
    if (email.isEmpty == true || password.isEmpty == true) {
      return const UserReturn(
        status: false,
        message: "Please fill the field.",
      );
    }
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await setupUserInformationOnRegister(username, email, credential);
      return const UserReturn(
        status: true,
        message: "Registered successfully",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const UserReturn(
          status: false,
          message: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        return const UserReturn(
          status: false,
          message: "The account already exists for that email.",
        );
      }
      return const UserReturn(
        status: false,
        message: "Please, verify the information entered",
      );
    } catch (e) {
      return const UserReturn(status: false, message: "An error occured");
    }
  }

  Future<bool> setupUserInformationOnLogin(UserCredential credential) async {
    try {
      _name = credential.user?.displayName ?? "No username";
      _email = credential.user?.email ?? "No email";
      _image = credential.user?.photoURL ??
          "https://static.vecteezy.com/ti/vecteur-libre/p3/2275847-male-avatar-profil-icone-de-souriant-caucasien-homme-vectoriel.jpg";
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<UserReturn> loginExistingUser(String email, String password) async {
    try {
      if (email.isEmpty == true || password.isEmpty == true) {
        return const UserReturn(
          status: false,
          message: "Please fill the information",
        );
      }
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await setupUserInformationOnLogin(credential);
      return const UserReturn(status: true, message: "Login successful");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const UserReturn(
          status: false,
          message: "No user found for that email.",
        );
      } else if (e.code == 'wrong-password') {
        return const UserReturn(
          status: false,
          message: "Wrong password provided for that user.",
        );
      } else if (e.code == 'invalid-email') {
        return const UserReturn(
          status: false,
          message: "The email entered is invalid",
        );
      }
      return const UserReturn(
        status: false,
        message: "Please, verify the field",
      );
    } catch (error) {
      return const UserReturn(status: false, message: "An error occured");
    }
  }
}
