import 'package:flutter/material.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/pages/card_page.dart';
import 'package:teg_auto/widgets/favoritebutton.dart';
import 'package:teg_auto/widgets/imagehero.dart';
import 'package:teg_auto/widgets/info_display.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key, required this.card, required this.index});

  final Car card;
  final int index;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 350,
        width: 350,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 240,
              child: Stack(
                children: <Widget>[
                  ImageHero(
                    tag: "ImageHero${widget.index}",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<CardPage>(
                          builder: (BuildContext context) => CardPage(
                            title: "Details",
                            data: widget.card,
                            index: widget.index,
                          ),
                        ),
                      );
                    },
                    height: 170,
                    width: 350,
                    image: widget.card.image,
                  ),
                  Positioned(
                    top: 140,
                    right: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 57,
                      width: 57,
                      child: FavoriteButton(carSelected: widget.card),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 10,
                    child: Text(
                      widget.card.brand,
                      style:
                          const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],),
            ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 150,
                      ),
                      child:  Text(
                          widget.card.model,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 22),
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 150,
                      ),
                      child:  Text(
                      "${widget.card.price} €",
                      maxLines: 1,
                      style: const TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InfoDisplay(
                      text: "${widget.card.km} km",
                      height: 45,
                      width: 90,
                      fontSize: 18,
                    ),
                    InfoDisplay(
                      text: widget.card.color,
                      height: 45,
                      width: 90,
                      fontSize: 20,
                    ),
                    InfoDisplay(
                      text: widget.card.year,
                      height: 45,
                      width: 90,
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
