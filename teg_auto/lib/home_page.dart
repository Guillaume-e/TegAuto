import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teg_auto/classes/itemcard.dart';
import 'package:teg_auto/counter_bloc.dart';
import 'package:teg_auto/widgets/homecard.dart';

const List<ItemCard> data = [
    ItemCard(
  image: "assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg",
  brand: "Bmw",
  model: "M8 Competition",
  price: "100000",
  km: "10",
  color: "Blue",
  state: "New",
  ),
    ItemCard(
  image: "assets/images/1-manthey-911-gt3-rs-mr-2020-first-drive-hero-front.jpg",
  brand: "Porsche",
  model: "911 GT3 RS",
  price: "90000",
  km: "30K",
  color: "Green",
  state: "Used",
  ),
    ItemCard(
  image: "assets/images/MANHART-Urus-800-Website-3.jpg",
  brand: "Lamborghini",
  model: "Urus",
  price: "190000",
  km: "0",
  color: "Yellow",
  state: "New",
  )
];

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blue),
      body: BlocBuilder<CounterBloc, int>(
        builder: (_, int counter) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      child: GridView.builder(
        itemCount:data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 50,
        ),
        itemBuilder: (BuildContext context,int index,) {
            return HomeCard(card: data[index]);
        },),
    );
    },),);
  }
}