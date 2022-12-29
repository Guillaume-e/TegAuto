import 'package:flutter/material.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/pages/card_page.dart';
import 'package:teg_auto/widgets/favoritebutton.dart';
import 'package:teg_auto/widgets/imagehero.dart';
import 'package:teg_auto/widgets/info_display.dart';

class HomeCardVar extends StatefulWidget {
  const HomeCardVar({super.key, required this.card, required this.index});

  final Car card;
  final int index;

  @override
  State<HomeCardVar> createState() => _HomeCardVarState();
}

class _HomeCardVarState extends State<HomeCardVar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: size.height * 0.7,
          maxWidth: size.width * 0.40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        height: size.height * 0.7,
        width: size.width * 0.40,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.45,
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
                    height: size.height * 0.35,
                    width: size.width,
                    image: widget.card.image,
                  ),
                  Positioned(
                    top: size.height * 0.30,
                    right: size.width * 0.05,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: size.height * 0.08,
                      width: size.height * 0.08,
                      child: FavoriteButton(carSelected: widget.card),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.38,
                    left: size.width * 0.025,
                    child: Text(
                      widget.card.brand,
                      style: TextStyle(
                        fontSize: size.width * 0.030,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: size.width * 0.15,
                    ),
                    child: Text(
                      widget.card.model,
                      maxLines: 1,
                      style: TextStyle(fontSize: size.width * 0.025),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: size.width * 0.15,
                    ),
                    child: Text(
                      "${widget.card.price} €",
                      maxLines: 1,
                      style: TextStyle(fontSize: size.width * 0.025),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.01),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <InfoDisplay>[
                    InfoDisplay(
                      text: "${widget.card.km} km",
                      height: size.width * 0.045,
                      width: size.width * 0.07,
                      fontSize: size.width * 0.015,
                    ),
                    InfoDisplay(
                      text: widget.card.color,
                      height: size.width * 0.045,
                      width: size.width * 0.07,
                      fontSize: size.width * 0.016,
                    ),
                    InfoDisplay(
                      text: widget.card.year,
                      height: size.width * 0.045,
                      width: size.width * 0.07,
                      fontSize: size.width * 0.018,
                    )
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
