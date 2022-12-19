import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/authentication/authentication_page.dart';
import 'package:teg_auto/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEG Auto',
      home: Provider<User>(
        create: (_) => User(),
        child: const AuthenticationPage(),
      ), // AuthenticationPage(),
    );
  }
}
