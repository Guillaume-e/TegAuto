import 'package:flutter/material.dart';
import 'package:teg_auto/pages/admin_page.dart';
import 'package:teg_auto/pages/home_page.dart';
import 'package:teg_auto/pages/profil_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  final bool _isAdmin = true;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(title: "Home"),
    ProfilPage(title: "Profil"),
    AdminPage(title: "Admin")
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.blue),
              child: const Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
            backgroundColor: const Color.fromARGB(255, 159, 163, 158),
            activeIcon: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.blue),
              child: const Icon(Icons.person),
            ),
          ),
          if (_isAdmin == true)
            BottomNavigationBarItem(
              icon: const Icon(Icons.shield),
              label: 'Admin',
              backgroundColor: const Color.fromARGB(255, 159, 163, 158),
              activeIcon: Container(
                height: 35,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue),
                child: const Icon(Icons.shield),
              ),
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
