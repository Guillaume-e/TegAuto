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
                    height: size.height * 0.45,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: size.width * 0.35,
                          height: size.height * 0.25,
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
                                    MainAxisAlignment.spaceEvenly,
                                children: <Text>[
                                  Text(
                                    widget.data.model,
                                    style:
                                        TextStyle(fontSize: size.width * 0.02),
                                  ),
                                  Text(
                                    "${widget.data.price} €",
                                    style:
                                        TextStyle(fontSize: size.width * 0.02),
                                  ),
                                ],
                              ),
                              Row(
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
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          thickness: 5,
                          color: Colors.black,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Details",
                              style: TextStyle(
                                fontSize: size.width * 0.015,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.4,
                              width: size.height * 0.5,
                              child: Text(
                                widget.data.details,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: size.width * 0.011),
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
              return Stack(
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
                  Positioned(
                    top: size.height * 0.3,
                    left: size.height * 0.03,
                    child: Text(
                      widget.data.brand,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.35,
                    left: size.height * 0.02,
                    child: Text(
                      widget.data.model,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.35,
                    right: size.height * 0.02,
                    child: Text(
                      "${widget.data.price} €",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.43,
                    left: size.height * 0.02,
                    child: InfoDisplay(
                      text: "${widget.data.km} km",
                      height: 35,
                      width: 90,
                      fontSize: 22,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.43,
                    left: size.height * 0.22,
                    child: InfoDisplay(
                      text: widget.data.color,
                      height: 35,
                      width: 90,
                      fontSize: 22,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.43,
                    right: size.height * 0.02,
                    child: InfoDisplay(
                      text: widget.data.year,
                      height: 35,
                      width: 90,
                      fontSize: 22,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.5,
                    right: size.height * 0.03,
                    child: const Divider(),
                  ),
                  Positioned(
                    top: size.height * 0.55,
                    left: size.height * 0.02,
                    child: SizedBox(
                      height: size.height * 0.3,
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
