import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/car_list.dart';
import 'package:teg_auto/model/user_return.dart';

class UserManagement extends ChangeNotifier {
  UserManagement();
  UserManagement.initialise(
    String name,
    String email,
    String image,
    bool adminState,
  ) {
    setName(name);
    setEmail(email);
    setImage(image);
    setAdminStatus(adminState);
  }

  String _name = "";
  String _email = "";
  bool _isAdmin = false;
  String _image = "";
  CarsList _cars = CarsList();
  CarsList _favoriteCars = CarsList();

  void setName(String newName) {
    _name = newName;
  }

  void setEmail(String newEmail) {
    _email = newEmail;
  }

  void setAdminStatus(bool adminStatus) {
    _isAdmin = adminStatus;
  }

  void setImage(String newImage) async {
    _image = newImage;
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(newImage);
    notifyListeners();
  }

  void setCars(List<Car> carsToSell) {
    _cars.setCarList(carsToSell);
    notifyListeners();
  }

  void setFavoritesCars(List<Car> favoritesCars) {
    _favoriteCars.setCarList(favoritesCars);
    notifyListeners();
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

  List<Car> getCarsToSell() {
    return _cars.getCarsList();
  }

  List<Car> getFavoritesUserCars() {
    return _favoriteCars.getCarsList();
  }

  bool isCarFavorite(Car carToCheck) {
    final List<Car> favoriteList = _favoriteCars.getCarsList();
    final Car foundElem = favoriteList.firstWhere(
      (Car element) => element.id == carToCheck.id,
      orElse: () => const Car(
        id: "-1",
        image: "null",
        brand: "null",
        model: "null",
        price: "null",
        km: "null",
        color: "null",
        year: "null",
        details: "null",
        engine: "null",
      ),
    );
    if (foundElem.id.compareTo("-1") == 0) return false;
    return true;
  }

  void retrieveSellCar() async {
    final List<Car> carList =
        await CarsList().getUserCarListFromDatabase(_email);
    _cars.setCarList(carList);
  }

  void retrieveFavoriteCar() async {
    final List<Car> favoriteCarList =
        await CarsList().getUserFavoriteCarListFromDatabase(_email);
    _favoriteCars.setCarList(favoriteCarList);
  }

  Future<UserReturn> addFavoriteCar(Car newFavoriteCar) async {
    final UserReturn addItemReponse =
        await _favoriteCars.addItemInFavorites(newFavoriteCar, _email);
    retrieveFavoriteCar();
    return addItemReponse;
  }

  Future<UserReturn> removeFavoriteCar(Car carToRemove) async {
    final UserReturn removeResponse =
        await _favoriteCars.removeItemInFavorites(carToRemove, _email);
    retrieveFavoriteCar();
    return removeResponse;
  }

  Future<UserReturn> removeSellCar(Car carToRemove) async {
    final UserReturn removeResponse =
        await _cars.removeCarInUserSellList(carToRemove, _email);
    return removeResponse;
  }

  Future<bool> createUserInDatabase(UserCredential credential) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final Map<String, dynamic> userData = <String, dynamic>{
        "FavoritesCars": <Car>[],
        "CarsToSell": <Car>[],
        "IsAdmin": false,
        "Uuid": credential.user?.uid,
        "Email": credential.user?.email,
        "Username": _name,
        "Userimage": credential.user?.photoURL ?? ""
      };
      await database.collection("Users").doc(_email).set(userData);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> setupUserInformationOnRegister(
    String username,
    String email,
    UserCredential credential,
  ) async {
    try {
      final User? actualUser = credential.user;
      await actualUser?.updateDisplayName(username);
      _email = email;
      _name = username;
      await createUserInDatabase(credential);
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

  Future<bool> retrieveUserInformation() async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> userDocument =
          await database.collection("Users").doc(_email).get();
      _cars = CarsList.fromJSON(userDocument.get("CarsToSell"));
      _favoriteCars = CarsList.fromJSON(userDocument.get("FavoritesCars"));
      _isAdmin = userDocument.get("IsAdmin");
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> setupUserInformationOnLogin(UserCredential credential) async {
    try {
      _name = credential.user?.displayName ?? "No username";
      _email = credential.user?.email ?? "No email";
      _image = credential.user?.photoURL ??
          "https://static.vecteezy.com/ti/vecteur-libre/p3/2275847-male-avatar-profil-icone-de-souriant-caucasien-homme-vectoriel.jpg";
      await retrieveUserInformation();
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
