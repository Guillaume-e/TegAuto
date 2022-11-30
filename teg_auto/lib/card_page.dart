import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teg_auto/classes/itemcard.dart';
import 'package:teg_auto/counter_bloc.dart';
import 'package:teg_auto/widgets/favoritebutton.dart';
import 'package:teg_auto/widgets/imagehero.dart';
import 'package:teg_auto/widgets/info_display.dart';


// const ItemCard data =
//     ItemCard(
//   image: "assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg",
//   brand: "Bmw",
//   model: "M8 Competition",
//   price: "100000",
//   km: "10",
//   color: "Blue",
//   state: "New",
//   details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
//   );

class CardPage extends StatefulWidget {
  const CardPage({super.key, required this.title, required this.data});

  final String title;
  final ItemCard data;
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blue),
      body: BlocBuilder<CounterBloc, int>(
        builder: (_, int counter) {
    return Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: size.height,
          width: size.width,
          child: Stack(
              children: [
                ImageHero(
                  tag: "HeroImage",
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  height: size.height * 0.25,
                  width: size.width,
                  image: widget.data.image,
                ),
                Positioned(
                  top: size.height * 0.2,
                  right: size.width * 0.1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100)),
                    height: size.height * 0.08,
                    width: size.height * 0.08,
                    child: const FavoriteButton(),
                ),),
                Positioned(
                  top: size.height * 0.3,
                  left: size.height * 0.03,
                  child: Text(widget.data.brand, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),),
                Positioned(
                  top: size.height * 0.35,
                  left: size.height * 0.02,
                  child: Text(widget.data.model, style: const TextStyle(fontSize: 25),),),
                Positioned(
                  top: size.height * 0.35,
                  right: size.height * 0.02,
                  child: Text("${widget.data.price} €", style: const TextStyle(fontSize: 25),),),
                Positioned(
                  top: size.height * 0.43,
                  left: size.height * 0.02,
                  child: InfoDisplay(text: "${widget.data.km} km"),),
                Positioned(
                  top: size.height * 0.43,
                  left: size.height * 0.22,
                  child: InfoDisplay(text: widget.data.color,),),
                Positioned(
                  top: size.height * 0.43,
                  right: size.height * 0.02,
                  child: InfoDisplay(text: widget.data.state),),
                Positioned(
                  top: size.height * 0.5,
                  right: size.height * 0.03,
                  child: Container(
                    height: 2,
                    width: size.height * 0.5,
                    decoration: const BoxDecoration(color: Colors.black),),),
                Positioned(
                  top: size.height * 0.55,
                  left: size.height * 0.02,
                  child: SizedBox(
                    height: size.height * 0.3,
                    width: size.height * 0.52,
                    child: Text(widget.data.details, textAlign: TextAlign.justify, style: const TextStyle(fontSize: 14),),),)
              ],
          ),
      );
    },),);
  }
}