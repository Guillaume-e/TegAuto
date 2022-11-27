import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teg_auto/classes/itemcard.dart';
import 'package:teg_auto/counter_bloc.dart';
import 'package:teg_auto/home_page.dart';
import 'package:teg_auto/widgets/homecard.dart';

const ItemCard data = 
  ItemCard(
  image: "assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg",
  brand: "Bmw",
  model: "M8 Competition",
  price: "100000",
  km: "10",
  color: "Blue",
  state: "New",
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
        child: const HomePage(title: "Home",),
      ),
    );
  }
}
