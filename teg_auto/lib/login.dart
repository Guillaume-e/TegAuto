import 'package:flutter/material.dart';
import 'package:teg_auto/authentication_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            const Text(
              "TEG Auto",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 60),
            ),
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <AuthenticationButton>[
                  AuthenticationButton(name: "LOG IN"),
                  AuthenticationButton(name: "REGISTER")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
