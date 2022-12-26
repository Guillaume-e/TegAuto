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

  List<Car> getCarsList() {
    return _carsList;
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

  Future<UserReturn> addItemInCarList(Car newItemToAdd) async {
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
      notifyListeners();
      return const UserReturn(
        status: true,
        message: "Car added successfully",
      );
    } catch (error) {
      return const UserReturn(
        status: false,
        message: "Failed to add car in the list",
      );
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
