import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teg_auto/home_page.dart';
import 'package:teg_auto/pages/profil_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teg Auto",
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: 'Confortaa'),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final bool _isAdmin = true;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(title: "Home"),
    ProfilPage(title: "Profil"),
    Text(
      'Index 3: Admin',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: const Color.fromARGB(255, 159, 163, 158),
            activeIcon: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(borderRadius:   BorderRadius.circular(100), color: Colors.blue),
              child: const Icon(Icons.home),),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
            backgroundColor: const Color.fromARGB(255, 159, 163, 158),
            activeIcon: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(borderRadius:   BorderRadius.circular(100), color: Colors.blue),
              child: const Icon(Icons.person),),
          ),
          if (_isAdmin == true) BottomNavigationBarItem(
            icon: const Icon(Icons.shield),
            label: 'Admin',
            backgroundColor: const Color.fromARGB(255, 159, 163, 158),
            activeIcon: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(borderRadius:   BorderRadius.circular(100), color: Colors.blue),
              child: const Icon(Icons.shield),),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}