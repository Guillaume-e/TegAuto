import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/user_return.dart';

class CarsList extends ChangeNotifier {
  CarsList();
  CarsList.fromDatabase() {
    getCarListFromDatabase();
  }
  CarsList.fromJSON(List<dynamic> jsonCarList)
      : _carsList = List<Car>.from(
          jsonCarList.map<Car>(
            (dynamic jsonElement) => Car.fromJSON(jsonElement),
          ),
        );

  List<Car> _carsList = <Car>[];

  void setCarList(List<Car> newCarList) {
    _carsList = newCarList;
    notifyListeners();
  }

  List<dynamic> convertCarListToJSON(List<Car> listToConvert) {
    final List<dynamic> transformedList =
        List<dynamic>.from(listToConvert.map((Car e) => e.toJSON()));
    return transformedList;
  }

  List<Car> getCarsList() {
    return _carsList;
  }

  Future<List<Car>> getUserCarListFromDatabase(String email) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await database.collection("Users").doc(email).get();
      final List<dynamic> userSellCar = userDoc.get("CarsToSell");
      final List<Car> userCarList = List<Car>.from(
        userSellCar.map<Car>((dynamic elem) => Car.fromJSON(elem)),
      );
      return userCarList;
    } catch (error) {
      return <Car>[];
    }
  }

  Future<bool> getCarListFromDatabase() async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> carDocument =
          await database.collection("Advertisement").doc("Advertisement").get();
      if (carDocument.data()?.isEmpty == false) {
        final List<dynamic> carFromDatabase = carDocument.get("Advertisements");
        setCarList(
          List<Car>.from(
            carFromDatabase.map<Car>((dynamic elem) => Car.fromJSON(elem)),
          ),
        );
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  Future<UserReturn> addCarInUserCarSalesList(
    Car newCarToSell,
    String email,
  ) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await database.collection("Users").doc(email).get();
      final List<dynamic> userSellCar = userDoc.get("CarsToSell");
      userSellCar.add(newCarToSell.toJSON());
      await database
          .collection("Users")
          .doc(email)
          .update(<String, dynamic>{"CarsToSell": userSellCar});
      return const UserReturn(status: true, message: "Car added successfully");
    } catch (error) {
      return const UserReturn(
        status: false,
        message: "Car added in database but not linked with the connected user",
      );
    }
  }

  Future<UserReturn> addItemInCarList(Car newItemToAdd, String email) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> carDocument =
          await database.collection("Advertisement").doc("Advertisement").get();
      if (carDocument.data()?.isEmpty == false) {
        final List<dynamic> carListDb = carDocument.get("Advertisements");
        carListDb.add(newItemToAdd.toJSON());
        await database
            .collection("Advertisement")
            .doc("Advertisement")
            .update(<String, dynamic>{"Advertisements": carListDb});
      } else {
        await database
            .collection("Advertisement")
            .doc("Advertisement")
            .set(<String, dynamic>{
          "Advertisements": <dynamic>[newItemToAdd.toJSON()]
        });
      }
      final UserReturn userListAdd =
          await addCarInUserCarSalesList(newItemToAdd, email);
      if (userListAdd.status == true) {
        await getCarListFromDatabase();
        return userListAdd;
      } else {
        return userListAdd;
      }
    } catch (error) {
      return const UserReturn(
        status: false,
        message: "Failed to add car in the list",
      );
    }
  }

  Future<UserReturn> removeCarInUserSellList(
    Car itemToRemove,
    String email,
  ) async {
    try {
      developer.log("remove sell list");
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await database.collection("Users").doc(email).get();
      final List<dynamic> userSellDynamic = userDoc.get("CarsToSell");
      final List<Car> userAllSellCar = List<Car>.from(
        userSellDynamic.map<Car>((dynamic elem) => Car.fromJSON(elem)),
      );
      userAllSellCar
          .removeWhere((Car element) => element.id == itemToRemove.id);
      await database.collection("Users").doc(email).update(<String, dynamic>{
        "CarsToSell": convertCarListToJSON(userAllSellCar)
      });
      final UserReturn response = await removeItemInCarList(itemToRemove);
      if (response.status == true) await getCarListFromDatabase();
      return response;
    } catch (error) {
      developer.log("FAILED");
      print(error);
      return const UserReturn(status: false, message: "Car not remove");
    }
  }

  Future<UserReturn> removeItemInCarList(Car itemToRemove) async {
    try {
      developer.log("remove sell list Général");
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> carDocument =
          await database.collection("Advertisement").doc("Advertisement").get();
      final List<dynamic> carListDb = carDocument.get("Advertisements");
      final List<Car> allSellCar = List<Car>.from(
        carListDb.map<Car>((dynamic elem) => Car.fromJSON(elem)),
      );
      allSellCar.removeWhere((Car element) => element.id == itemToRemove.id);
      await database
          .collection("Advertisement")
          .doc("Advertisement")
          .update(<String, dynamic>{
        "Advertisements": convertCarListToJSON(allSellCar)
      });
      return const UserReturn(status: true, message: "Car remove successfully");
    } catch (error) {
      developer.log("FAILED");
      print(error);
      return const UserReturn(status: false, message: "Car not remove");
    }
  }

  Future<bool> addItemInFavorites(Car newFavoriteCar, String userEmail) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentReference<Map<String, dynamic>> userDoc =
          database.collection("Users").doc(userEmail);
      final DocumentSnapshot<Map<String, dynamic>> docInfos =
          await userDoc.get();
      final List<Car> favoritesCars = docInfos.get("FavoritesCars");
      favoritesCars.add(newFavoriteCar);
      await userDoc.update(<String, dynamic>{
        "FavoritesCars": favoritesCars,
      });
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> removeItemInFavorites(Car carToDelete, String userEmail) async {
    try {
      developer.log("remove favorites list");
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> docInfos =
          await database.collection("Users").doc(userEmail).get();
      final List<Car> favoriteCar = docInfos.get("FavoritesCars");
      final bool removeStatus = favoriteCar.remove(carToDelete);
      if (removeStatus == true) {
        await database
            .collection("Users")
            .doc(userEmail)
            .update(<String, dynamic>{"FavoritesCars": favoriteCar});
      }
      return removeStatus;
    } catch (error) {
      return false;
    }
  }
}
