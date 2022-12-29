import 'package:cloud_firestore/cloud_firestore.dart';
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
            elem.get("Username"),
            elem.get("Email"),
            elem.get("Userimage"),
            elem.get("IsAdmin"),
          ),
        );
      }
      return userManagementList;
    } catch (error) {
      return <UserManagement>[];
    }
  }

  Future<UserReturn> setNewUserToAdmin(UserManagement? userToUpgrade) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      if (userToUpgrade?.getIsAdminStatus() == false) {
        await database
            .collection("Users")
            .doc(userToUpgrade?.getEmail())
            .update(<String, dynamic>{"IsAdmin": true});
        return UserReturn(
          status: true,
          message: "User ${userToUpgrade?.getName()} is now an Admin",
        );
      } else {
        await database
            .collection("Users")
            .doc(userToUpgrade?.getEmail())
            .update(<String, dynamic>{"IsAdmin": false});
        return UserReturn(
          status: true,
          message: "User ${userToUpgrade?.getName()} is not an Admin anymore",
        );
      }
    } catch (error) {
      return UserReturn(
        status: true,
        message: "Failed to ban User ${userToUpgrade?.getName()}",
      );
    }
  }
}
