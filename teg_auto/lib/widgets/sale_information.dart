import 'package:flutter/material.dart';
import 'package:teg_auto/classes/itemcard.dart';
import 'package:teg_auto/widgets/vehicule_card.dart';

// ignore: always_specify_types
const List<ItemCard> data = [
    ItemCard(
  image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.bmw.fr%2Ffr%2Ftous-les-modeles%2Fm-series%2Fm8-coupe%2F2022%2Fbmw-m8-coupe.html&psig=AOvVaw3LneJH0KlpHGIswCfTSuuk&ust=1671388649161000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLDy74qmgfwCFQAAAAAdAAAAABAd",
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

class SaleCard extends StatefulWidget {

  const SaleCard({
    Key? key,
    /*
    required this.imagePath,
    required this.brand,
    required this.model,
    required this.km,
    required this.price
    */

  }) : super(key: key);
  /*
  final String imagePath;
  final String brand;
  final String model;
  final String km;
  final String price;
  */

  @override
  State<SaleCard> createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      child: ListView.builder(
        itemCount:data.length,
        itemBuilder: (BuildContext context,int index,) {
            // ignore: avoid_returning_null_for_void
            return VehiculeCard(card: data[index], onPressed: () => null,);
        },),
    );
  }

}