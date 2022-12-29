import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/user_return.dart';

class CarsList extends ChangeNotifier {
  CarsList();
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

  Future<List<Car>> getUserFavoriteCarListFromDatabase(String email) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await database.collection("Users").doc(email).get();
      final List<dynamic> userSellCar = userDoc.get("FavoritesCars");
      final List<Car> userFavoriteCar = List<Car>.from(
        userSellCar.map<Car>((dynamic elem) => Car.fromJSON(elem)),
      );
      return userFavoriteCar;
    } catch (error) {
      return <Car>[];
    }
  }

  Future<List<Car>> getCarListFromDatabase() async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> carDocument =
          await database.collection("Advertisement").doc("Advertisement").get();
      if (carDocument.data()?.isEmpty == false) {
        final List<dynamic> carFromDatabase = carDocument.get("Advertisements");
        final List<Car> allCarList = List<Car>.from(
          carFromDatabase.map<Car>((dynamic elem) => Car.fromJSON(elem)),
        );
        return allCarList;
      }
      return <Car>[];
    } catch (error) {
      return <Car>[];
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
      notifyListeners();
      return userListAdd;
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
      notifyListeners();
      return response;
    } catch (error) {
      return const UserReturn(status: false, message: "Car not remove");
    }
  }

  Future<UserReturn> removeCarInUserSellListIfAdmin(Car itemToRemove) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final QuerySnapshot<Map<String, dynamic>> collectionSnapshot =
          await database.collection("Users").get();
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> docList =
          collectionSnapshot.docs;
      for (QueryDocumentSnapshot<Map<String, dynamic>> elem in docList) {
        final List<dynamic> userCarsToSell = elem.get("CarsToSell");
        final List<Car> allUserSellCar = List<Car>.from(
          userCarsToSell.map<Car>((dynamic elem) => Car.fromJSON(elem)),
        );
        final List<dynamic> userFavoriteCars = elem.get("FavoritesCars");
        final List<Car> allUserFavoritesCars = List<Car>.from(
          userFavoriteCars.map<Car>((dynamic elem) => Car.fromJSON(elem)),
        );
        final int isCarFind = allUserSellCar
            .indexWhere((Car element) => element.id == itemToRemove.id);
        final int isCarFavoriteFind = allUserFavoritesCars
            .indexWhere((Car element) => element.id == itemToRemove.id);
        if (isCarFind != -1) {
          allUserSellCar.removeAt(isCarFind);
          await database
              .collection("Users")
              .doc(elem.get("Email"))
              .update(<String, dynamic>{
            "CarsToSell": convertCarListToJSON(allUserSellCar)
          });
        }
        if (isCarFavoriteFind != -1) {
          allUserFavoritesCars.removeAt(isCarFavoriteFind);
          await database
              .collection("Users")
              .doc(elem.get("Email"))
              .update(<String, dynamic>{
            "FavoritesCars": convertCarListToJSON(allUserFavoritesCars)
          });
        }
      }
      final UserReturn response = await removeItemInCarList(itemToRemove);
      notifyListeners();
      return response;
    } catch (error) {
      return const UserReturn(status: false, message: "Car not remove");
    }
  }

  Future<UserReturn> removeItemInCarList(Car itemToRemove) async {
    try {
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
      return const UserReturn(status: false, message: "Car not remove");
    }
  }

  Future<UserReturn> addItemInFavorites(
    Car newFavoriteCar,
    String userEmail,
  ) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentReference<Map<String, dynamic>> userDoc =
          database.collection("Users").doc(userEmail);
      final DocumentSnapshot<Map<String, dynamic>> docInfos =
          await userDoc.get();
      final List<dynamic> favoritesCars = docInfos.get("FavoritesCars");
      favoritesCars.add(newFavoriteCar.toJSON());
      await userDoc.update(<String, dynamic>{
        "FavoritesCars": favoritesCars,
      });
      notifyListeners();
      return const UserReturn(status: true, message: "Car added in favorite");
    } catch (error) {
      return const UserReturn(
        status: false,
        message: "Car not added in favorite",
      );
    }
  }

  Future<UserReturn> removeItemInFavorites(
    Car carToDelete,
    String userEmail,
  ) async {
    try {
      final FirebaseFirestore database = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> docInfos =
          await database.collection("Users").doc(userEmail).get();
      final List<dynamic> favoriteCarDynamic = docInfos.get("FavoritesCars");
      final List<Car> userFavCarList = List<Car>.from(
        favoriteCarDynamic.map<Car>((dynamic elem) => Car.fromJSON(elem)),
      );
      userFavCarList.removeWhere((Car element) => element.id == carToDelete.id);
      await database
          .collection("Users")
          .doc(userEmail)
          .update(<String, dynamic>{
        "FavoritesCars": convertCarListToJSON(userFavCarList)
      });
      notifyListeners();
      return const UserReturn(status: true, message: "Car remove in favorite");
    } catch (error) {
      return const UserReturn(
        status: false,
        message: "Car not remove in favorite",
      );
    }
  }
}
