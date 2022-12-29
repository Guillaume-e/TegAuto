import 'package:flutter/material.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/widgets/favoritebutton.dart';
import 'package:teg_auto/widgets/imagehero.dart';
import 'package:teg_auto/widgets/info_display.dart';

class CardPage extends StatefulWidget {
  const CardPage({
    super.key,
    required this.title,
    required this.data,
    required this.index,
  });

  final String title;
  final Car data;
  final int index;
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blue),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: size.height,
        width: size.width,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.45,
                    child: Stack(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <ImageHero>[
                            ImageHero(
                              tag: "ImageHero${widget.index}",
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              height: size.height * 0.4,
                              width: size.width * 0.6,
                              image: widget.data.image,
                            ),
                          ],
                        ),
                        Positioned(
                          top: size.height * 0.35,
                          right: size.width * 0.3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: size.height * 0.08,
                            width: size.height * 0.08,
                            child: FavoriteButton(carSelected: widget.data),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: size.width * 0.45,
                          height: size.height * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.data.brand,
                                style: TextStyle(
                                  fontSize: size.width * 0.025,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: size.width * 0.22,
                                    ),
                                    child: Text(
                                      widget.data.model,
                                      style:
                                          TextStyle(fontSize: size.width * 0.02),
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: size.width * 0.2,
                                    ),
                                    child: Text(
                                      "${widget.data.price} €",
                                      style:
                                          TextStyle(fontSize: size.width * 0.02),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <InfoDisplay>[
                                    InfoDisplay(
                                      text: "${widget.data.km} km",
                                      height: size.width * 0.045,
                                      width: size.width * 0.07,
                                      fontSize: size.width * 0.015,
                                    ),
                                    InfoDisplay(
                                      text: widget.data.color,
                                      height: size.width * 0.045,
                                      width: size.width * 0.07,
                                      fontSize: size.width * 0.015,
                                    ),
                                    InfoDisplay(
                                      text: widget.data.year,
                                      height: size.width * 0.045,
                                      width: size.width * 0.07,
                                      fontSize: size.width * 0.015,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.35,
                          child: const VerticalDivider(
                            thickness: 3,
                            color: Colors.blue,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Details",
                              style: TextStyle(
                                fontSize: size.width * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height * 0.3,
                                maxWidth: size.width * 0.4,
                              ),
                              margin: const EdgeInsets.only(top: 10),
                              width: size.height * 0.4,
                              child: Text(
                                widget.data.details,
                                textAlign: TextAlign.justify,
                                maxLines: 10,
                                style: TextStyle(fontSize: size.width * 0.018),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.30,
                    width: size.width,
                    child: Stack(
                      children: <Widget>[
                        ImageHero(
                          tag: "ImageHero${widget.index}",
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
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: size.height * 0.08,
                            width: size.height * 0.08,
                            child: FavoriteButton(carSelected: widget.data),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      widget.data.brand,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: size.width * 0.9,
                      height: size.height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: size.width * 0.4,
                            ),
                            child: Text(
                              widget.data.model,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: size.width * 0.45,
                            ),
                            child: Text(
                              "${widget.data.price} €",
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InfoDisplay(
                          text: "${widget.data.km} km",
                          height: 55,
                          width: 110,
                          fontSize: 20,
                        ),
                        InfoDisplay(
                          text: widget.data.color,
                          height: 55,
                          width: 110,
                          fontSize: 20,
                        ),
                        InfoDisplay(
                          text: widget.data.year,
                          height: 55,
                          width: 110,
                          fontSize: 20,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: size.width * 0.9,
                      child: const Divider(color: Colors.blue, thickness: 2),
                    ),
                  ),
                  const Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: size.width * 0.9,
                      margin: const EdgeInsets.only(top: 10),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        widget.data.details,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
