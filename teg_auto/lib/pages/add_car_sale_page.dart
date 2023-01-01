import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/car_list.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/model/user_return.dart';
import 'package:teg_auto/widgets/pick_image_car_sale.dart';
import 'package:teg_auto/widgets/text_form_field_car_sale.dart';

class AddCarSale extends StatefulWidget {
  const AddCarSale({super.key});

  @override
  State<AddCarSale> createState() => _AddCarSaleState();
}

class _AddCarSaleState extends State<AddCarSale> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String _brand = "";
  late String _model = "";
  late String _year = "";
  late String _kilometer = "";
  late String _price = "";
  late String _description = "";
  late String _engine = "";
  late String _color = "";
  late String _imagePath = "";

  void _getBrand(String brand) {
    _brand = brand;
  }

  void _getModel(String model) {
    _model = model;
  }

  void _getYear(String year) {
    _year = year;
  }

  void _getKilometer(String kilometer) {
    _kilometer = kilometer;
  }

  void _getPrice(String price) {
    _price = price;
  }

  void _getDescription(String description) {
    _description = description;
  }

  void _getEngine(String engine) {
    _engine = engine;
  }

  void _getColor(String color) {
    _color = color;
  }

  void _getImagePath(String imagePath) {
    _imagePath = imagePath;
  }

  Future<bool> _saveForm() async {
    final ScaffoldMessengerState scaffoldRef = ScaffoldMessenger.of(context);
    if (_imagePath.isEmpty == true) {
      scaffoldRef
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text("Please select an image")),
        );
      return false;
    }
    if (_formKey.currentState!.validate()) {
      final List<String> split = _imagePath.split('/');
      final String filename = split[split.length-1];
      const String filepathFirebase = "https://firebasestorage.googleapis.com/v0/b/tegauto-573df.appspot.com/o/car_sale%2F";
      const String altmedia = "?alt=media";
      final Car carToAdd = Car(
        id: UniqueKey().toString(),
        brand: _brand,
        image: filepathFirebase+filename+altmedia,
        model: _model,
        price: _price,
        km: _kilometer,
        color: _color,
        year: _year,
        details: _description,
        engine: _engine,
      );
      
      final CarsList carList = context.read<CarsList>();
      final UserManagement connectedUser = context.read<UserManagement>();
      final UserReturn response =
          await carList.addItemInCarList(carToAdd, connectedUser.getEmail());
      await carList.addImageToFirebaseStorage(_imagePath);
      connectedUser.retrieveSellCar();
      final List<Car> allCars = await carList.getCarListFromDatabase();
      carList.setCarList(allCars);
      scaffoldRef
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(response.message)),
        );
      return response.status;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new car to sell'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: PickImageCarSale(callback: _getImagePath),
                ),
                TextFormFieldCarSale(
                  labelText: "Brand",
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  callback: _getBrand,
                  maxCharacter: 15,
                ),
                TextFormFieldCarSale(
                  labelText: "Model",
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  callback: _getModel,
                  maxCharacter: 30,
                ),
                TextFormFieldCarSale(
                  labelText: "Price",
                  maxLines: 1,
                  textInputType: TextInputType.number,
                  callback: _getPrice,
                  maxCharacter: 11,
                ),
                TextFormFieldCarSale(
                  labelText: "Year",
                  maxLines: 1,
                  textInputType: TextInputType.number,
                  callback: _getYear,
                  maxCharacter: 4,
                ),
                TextFormFieldCarSale(
                  labelText: "Kilometer",
                  maxLines: 1,
                  textInputType: TextInputType.number,
                  callback: _getKilometer,
                  maxCharacter: 11,
                ),
                TextFormFieldCarSale(
                  labelText: "Color",
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  callback: _getColor,
                  maxCharacter: 30,
                ),
                TextFormFieldCarSale(
                  labelText: "Engine",
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  callback: _getEngine,
                  maxCharacter: 30,
                ),
                TextFormFieldCarSale(
                  labelText: "Description",
                  maxLines: 5,
                  textInputType: TextInputType.text,
                  callback: _getDescription,
                  maxCharacter: 200,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: _saveForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Publish'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
