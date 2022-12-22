import 'package:flutter/foundation.dart';
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

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      if (kDebugMode) {
        print(_formKey);
        print('Got a valid input');
      }
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
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PickImage(),
              ),
              const TextFormFieldCarSale(labelText: "Brand", maxLines: 1, textInputType: TextInputType.text),
              const TextFormFieldCarSale(labelText: "Model", maxLines: 1, textInputType: TextInputType.text),
              const TextFormFieldCarSale(labelText: "Year", maxLines: 1, textInputType: TextInputType.number),
              const TextFormFieldCarSale(labelText: "Kilometer", maxLines: 1, textInputType: TextInputType.number),
              const TextFormFieldCarSale(labelText: "Model", maxLines: 1, textInputType: TextInputType.text),
              const TextFormFieldCarSale(labelText: "Engine", maxLines: 1, textInputType: TextInputType.text),
              const TextFormFieldCarSale(labelText: "Description", maxLines: 5, textInputType: TextInputType.text),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: _saveForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
