import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/model/user_return.dart';

class UserManagementList extends ChangeNotifier {
  UserManagementList();

  List<UserManagement> _allUser = <UserManagement>[];

  void setUserList(List<UserManagement> newUserList) {
    _allUser = newUserList;
    notifyListeners();
  }

  List<UserManagement> getAllUserList() {
    return _allUser;
  }

  Future<List<UserManagement>> retrieveAllUserInDatabase() async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final QuerySnapshot<Map<String, dynamic>> collectionSnapshot =
          await database.collection("Users").get();
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> docList =
          collectionSnapshot.docs;
      final List<UserManagement> userManagementList = <UserManagement>[];
      for (QueryDocumentSnapshot<Map<String, dynamic>> elem in docList) {
        userManagementList.add(
          UserManagement.initialise(
            elem.data()["Username"],
            elem.data()["Email"],
            elem.data()["Userimage"],
          ),
        );
      }
      return userManagementList;
    } catch (error) {
      developer.log("FAILED");
      print(error);
      return <UserManagement>[];
    }
  }

  Future<UserReturn> banSelectedUser(UserManagement? userToBan) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final FirebaseAuth authSession = FirebaseAuth.instance;
      return UserReturn(
        status: true,
        message: "User ${userToBan?.getName()} is banned",
      );
    } catch (error) {
      return UserReturn(
        status: true,
        message: "Failed to ban User ${userToBan?.getName()}",
      );
    }
  }
}
