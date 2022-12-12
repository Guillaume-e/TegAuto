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

class AdminPage extends StatefulWidget {
  const AdminPage({super.key, required this.title});

  final String title;
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blue),
      body: BlocBuilder<CounterBloc, int>(
        builder: (_, int counter) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(top: 10),
            child: const Text("Ban User", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 400,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10),
              width: 250,
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.block, color: Colors.black, size: 30),
                    Center(child: Text("Ban", style: TextStyle(fontSize: 22),)),
                  ],
                ),
              ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 2,
              width: size.width * 0.6,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10),
            child: const Text("All Sales", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
          ),
        ],
      ),
    );
    },),);
  }
}