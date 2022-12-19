import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teg_auto/card_page.dart';
import 'package:teg_auto/admin_page.dart';
import 'package:teg_auto/classes/itemcard.dart';
import 'package:teg_auto/counter_bloc.dart';
import 'package:teg_auto/home_page.dart';

const ItemCard data = 
  ItemCard(
  image: "assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg",
  brand: "Bmw",
  model: "M8 Competition",
  price: "100000",
  km: "10",
  color: "Blue",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  )
  ;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teg Auto",
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: 'Confortaa'),
      home: BlocProvider<CounterBloc>(
        create: (_) => CounterBloc(),
        child: const MyStatefulWidget(),
      ),
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
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
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
              decoration: BoxDecoration(borderRadius:   BorderRadius.circular(100), color: Colors.blue),
              child: const Icon(Icons.home),),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add),
            label: 'New',
            backgroundColor: const Color.fromARGB(255, 159, 163, 158),
            activeIcon: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(borderRadius:   BorderRadius.circular(100), color: Colors.blue),
              child: const Icon(Icons.add),),
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