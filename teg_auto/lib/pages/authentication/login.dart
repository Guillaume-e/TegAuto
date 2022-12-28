import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/model/user_return.dart';
import 'package:teg_auto/pages/authentication/authentication_button.dart';
import 'package:teg_auto/pages/navigation_page.dart';
import 'package:teg_auto/widgets/text_input_component.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "";
  String _password = "";

  void goToHomePage() {
    final UserManagement user = context.read<UserManagement>();
    user.loginExistingUser(_email, _password).then((UserReturn loginResponse) {
      if (loginResponse.status == true) {
        user.setEmail(_email);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<NavigationPage>(
            builder: (BuildContext context) {
              return const NavigationPage();
            },
          ),
          (_) => false,
        );
      } else {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text(loginResponse.message)),
          );
      }
    });
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
