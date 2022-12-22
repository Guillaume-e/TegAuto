import 'package:flutter/material.dart';
import 'package:teg_auto/model/itemcard.dart';
import 'package:teg_auto/pages/add_car_sale_page.dart';
import 'package:teg_auto/widgets/homecard.dart';

const List<ItemCard> data = <ItemCard>[
    ItemCard(
  image: "assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg",
  brand: "Bmw",
  model: "M8 Competition",
  price: "100000",
  km: "10",
  color: "Blue",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
    ItemCard(
  image: "assets/images/1-manthey-911-gt3-rs-mr-2020-first-drive-hero-front.jpg",
  brand: "Porsche",
  model: "911 GT3 RS",
  price: "90000",
  km: "30K",
  color: "Green",
  state: "Used",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
    ItemCard(
  image: "assets/images/MANHART-Urus-800-Website-3.jpg",
  brand: "Lamborghini",
  model: "Urus",
  price: "190000",
  km: "0",
  color: "Yellow",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
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
    final Size size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blue),
      body: Container(
      decoration: const BoxDecoration(color: Colors.grey),
      child: Stack(children: <Widget>[

      GridView.builder(
        itemCount:data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 50,
        ),
        itemBuilder: (BuildContext context,int index,) {
            return HomeCard(card: data[index], index:index);
        },
      ),
      Positioned(
        right: size.width * 0.05,
        bottom: size.height * 0.05,
        child: ElevatedButton(
          onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<AddCarSale>(
                    builder: (BuildContext context) => const AddCarSale(),
                  ),
                );
              },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(70,70),
          ),
          child: const Icon(Icons.add_circle_outline, size: 40),
          ),
        ),
      ],),
    ),
  );
  }
}