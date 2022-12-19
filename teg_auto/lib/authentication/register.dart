import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/authentication/authentication_button.dart';
import 'package:teg_auto/component/text_input_component.dart';
import 'package:teg_auto/user.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _username = "";
  String _email = "";
  String _password = "";

  void goToHomePage() {
    final User user = context.watch<User>();
    final bool isConnected = user.registerNewUser(_username, _email, _password);
    if (isConnected == true) {
      user.setName(_username);
      user.setEmail(_email);
    }
  }

  void _getUserName(String name) {
    _username = name;
  }

  void _getEmail(String email) {
    _email = email;
  }

  void _getPassword(String password) {
    _password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Column(
        children: <Widget>[
          TextInputComponent(
            hintText: "Username or Pseudo",
            callback: _getUserName,
          ),
          TextInputComponent(
            hintText: "Email",
            callback: _getEmail,
          ),
          TextInputComponent(
            hintText: "Password",
            callback: _getPassword,
          ),
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
