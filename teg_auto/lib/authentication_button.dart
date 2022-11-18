import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {developer.log("Pressed Button $name")},
      child: Card(
        elevation: 1,
        color: name == "LOG IN" ? Colors.white : Colors.black,
        shape: const RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: name == "LOG IN" ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
