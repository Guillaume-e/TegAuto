import 'package:flutter/material.dart';
import 'package:teg_auto/authentication/authentication_button.dart';
import 'package:teg_auto/component/text_input_component.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void goToHomePage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
