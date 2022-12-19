import 'package:flutter/material.dart';
import 'package:teg_auto/model/itemcard.dart';
import 'package:teg_auto/pages/card_page.dart';
import 'package:teg_auto/widgets/favoritebutton.dart';
import 'package:teg_auto/widgets/imagehero.dart';
import 'package:teg_auto/widgets/info_display.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key, required this.card, required this.index});

  final ItemCard card;
  final int index;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
          return Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                height: 350,
                width: 350,
                child: Stack(
                  children: <Widget>[
                    ImageHero(
                      tag: "ImageHero${widget.index}",
                      onTap: () {
                        Navigator.push( context, MaterialPageRoute(builder: (BuildContext context) => CardPage(title: "Details", data: widget.card, index: widget.index)));
                      }, 
                      height: 170,
                      width: 350,
                      image: widget.card.image,
                      radius: 30,
                    ),
                    Positioned(
                      top: 140,
                      right: 30,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100)),
                        height: 57,
                        width: 57,
                        child: const FavoriteButton(),
                    ),),
                    Positioned(
                      bottom: 125,
                      left: 10,
                      child: Text(widget.card.brand, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),),
                    Positioned(
                      bottom: 90,
                      left: 7,
                      child: Text(widget.card.model, style: const TextStyle(fontSize: 25),),),
                    Positioned(
                      bottom: 90,
                      right: 7,
                      child: Text("${widget.card.price} €", style: const TextStyle(fontSize: 25),),),
                    Positioned(
                      bottom: 33,
                      left: 15,
                      child: InfoDisplay(text: "${widget.card.km} km"),),
                    Positioned(
                      bottom: 33,
                      left: 130,
                      child: InfoDisplay(text: widget.card.color,),),
                    Positioned(
                      bottom: 33,
                      right: 15,
                      child: InfoDisplay(text: widget.card.state),)
                  ],
                ),
              ),
            );
        }
}
