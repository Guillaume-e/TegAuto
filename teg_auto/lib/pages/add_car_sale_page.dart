
import 'package:flutter/material.dart';
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
   late String _power = "";
   late String _imagePath = "";
  // ItemCard car = new ItemCard(image: image, brand: brand, model: model, price: price, km: km, color: color, state: state, details: details);
  

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
  void _getPower(String power) {
    _power = power;
  }
  void _getImagePath(String imagePath) {
    _imagePath = imagePath;
  }
  
  void _saveForm() {
    if(_formKey.currentState!.validate()) {
       
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add car sale'),
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
              TextFormFieldCarSale(labelText: "Brand", maxLines: 1, textInputType: TextInputType.text, callback: _getBrand),
              TextFormFieldCarSale(labelText: "Model", maxLines: 1, textInputType: TextInputType.text, callback: _getModel),
              TextFormFieldCarSale(labelText: "Price", maxLines: 1, textInputType: TextInputType.number, callback: _getPrice),
              TextFormFieldCarSale(labelText: "Year", maxLines: 1, textInputType: TextInputType.number, callback: _getYear),
              TextFormFieldCarSale(labelText: "Kilometer", maxLines: 1, textInputType: TextInputType.number, callback: _getKilometer),
              TextFormFieldCarSale(labelText: "Power", maxLines: 1, textInputType: TextInputType.number, callback: _getPower),
              TextFormFieldCarSale(labelText: "Engine", maxLines: 1, textInputType: TextInputType.text, callback: _getEngine),
              TextFormFieldCarSale(labelText: "Description", maxLines: 5, textInputType: TextInputType.text, callback: _getDescription),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: _saveForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Publish'),),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
