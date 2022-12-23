import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teg_auto/model/car.dart';

class CarsList {
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
  }

  List<Car> getCarsList() {
    return _carsList;
  }

  bool addItemInCarList(Car newItemToAdd) {
    return false;
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
