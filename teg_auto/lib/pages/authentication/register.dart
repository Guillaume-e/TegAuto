import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/model/user_return.dart';
import 'package:teg_auto/pages/authentication/authentication_button.dart';
import 'package:teg_auto/pages/navigation_page.dart';
import 'package:teg_auto/widgets/text_input_component.dart';

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
    final UserManagement actualUser = context.read<UserManagement>();
    actualUser.registerNewUser(_username, _email, _password).then(
      (UserReturn registerResponse) {
        if (registerResponse.status == true) {
          actualUser.setName(_username);
          actualUser.setEmail(_email);
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
              SnackBar(content: Text(registerResponse.message)),
            );
        }
      },
    );
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
      body: Consumer<UserManagement>(
        builder: (BuildContext context, UserManagement value, Widget? child) {
          return Column(
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
          );
        },
      ),
    );
  }
}
