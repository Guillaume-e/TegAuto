import 'package:flutter/material.dart';
import 'package:teg_auto/authentication/authentication_button.dart';
import 'package:teg_auto/component/text_input_component.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void goToHomePage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Column(
        children: <Widget>[
          const TextInputComponent(),
          const TextInputComponent(),
          const TextInputComponent(),
          AuthenticationButton(
            name: "Register",
            backgroundColor: Colors.black,
            textColor: Colors.white,
            componentFunction: goToHomePage,
          )
        ],
      ),
    );
  }
}
