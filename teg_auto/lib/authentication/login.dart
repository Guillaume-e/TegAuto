import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/authentication/authentication_button.dart';
import 'package:teg_auto/component/text_input_component.dart';
import 'package:teg_auto/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "";
  String _password = "";

  void goToHomePage() {
    final User user = context.watch<User>();
    final bool isConnected = user.loginExistingUser(_email, _password);
    if (isConnected == true) {
      user.setEmail(_email);
    }
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
        title: const Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          TextInputComponent(
            hintText: "Email",
            callback: _getEmail,
          ),
          TextInputComponent(
            hintText: "Password",
            callback: _getPassword,
          ),
          AuthenticationButton(
            name: "Login",
            backgroundColor: Colors.black,
            textColor: Colors.white,
            componentFunction: goToHomePage,
          )
        ],
      ),
    );
  }
}
