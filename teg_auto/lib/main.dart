import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car_list.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/pages/authentication/authentication_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'teg_auto',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<CarsList>(create: (_) => CarsList()),
        ChangeNotifierProvider<UserManagement>(create: (_) => UserManagement())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "Teg Auto",
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Confortaa',
      ),
      home: const AuthenticationPage(),
    );
  }
}
