import 'package:flutter/material.dart';
import 'package:teg_auto/authentication/authentication_button.dart';
import 'package:teg_auto/authentication/login.dart';
import 'package:teg_auto/authentication/register.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  void goToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute<Login>(
        builder: (BuildContext context) {
          return const Login();
        },
      ),
    );
  }

  void goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute<Register>(
        builder: (BuildContext context) {
          return const Register();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Expanded(
              child: Center(
                child: Text(
                  "TEG Auto",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <AuthenticationButton>[
                  AuthenticationButton(
                    name: "LOG IN",
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    componentFunction: goToLoginPage,
                  ),
                  AuthenticationButton(
                    name: "REGISTER",
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    componentFunction: goToRegisterPage,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
