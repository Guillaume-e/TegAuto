import 'package:flutter/material.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/widgets/admin_list.dart';

const List<Car> data = <Car>[
  Car(
    image: "assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg",
    brand: "Bmw",
    model: "M8 Competition",
    price: "100000",
    km: "10",
    color: "Blue",
    year: "New",
    details: '',
    engine: "6 cylindres",
  ),
  Car(
    image:
        "assets/images/1-manthey-911-gt3-rs-mr-2020-first-drive-hero-front.jpg",
    brand: "Porsche",
    model: "911 GT3 RS",
    price: "90000",
    km: "30K",
    color: "Green",
    year: "Used",
    details: '',
    engine: "6 cylindres",
  ),
  Car(
    image: "assets/images/MANHART-Urus-800-Website-3.jpg",
    brand: "Lamborghini",
    model: "Urus",
    price: "190000",
    km: "0",
    color: "Yellow",
    year: "New",
    details: '',
    engine: "6 cylindres",
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "Ban User",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
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
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.block, color: Colors.black, size: 30),
                    Center(
                      child: Text(
                        "Ban",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
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
              child: const Text(
                "All Sales",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.4,
              child: const AdminList(title: "sales list"),
            ),
          ],
        ),
      ),
    );
  }
}
