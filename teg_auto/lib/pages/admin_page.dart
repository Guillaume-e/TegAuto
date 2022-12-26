import 'package:flutter/material.dart';
import 'package:teg_auto/model/itemcard.dart';
import 'package:teg_auto/widgets/admin_list.dart';
import 'package:teg_auto/widgets/vehicule_card.dart';

// ignore: always_specify_types
const List<ItemCard> data = <ItemCard>[
    ItemCard(
  image: "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg",
  brand: "Bmw",
  model: "M8 Competition",
  price: "100000",
  km: "10",
  color: "Blue",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
    ItemCard(
  image: "https://cdn.motor1.com/images/mgl/8bpn2/s1/4x3/2018-porsche-911-gt3-rs.webp",
  brand: "Porsche",
  model: "911 GT3 RS",
  price: "90000",
  km: "30K",
  color: "Green",
  state: "Used",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
    ItemCard(
    image: "https://cdn.motor1.com/images/mgl/AkBOMx/s1/lamborghini-urus-by-mansory-and-mtm.jpg",
  brand: "Lamborghini",
  model: "Urus",
  price: "190000",
  km: "0",
  color: "Yellow",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
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
                    children: const <Widget> [
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
            SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.4,
              child: const AdminList(title: "sales list")),
          ],
        ),
      ),
    );
  }
}