import 'package:flutter/material.dart';
import 'package:teg_auto/model/itemcard.dart';
import 'package:teg_auto/widgets/favoritebutton.dart';
import 'package:teg_auto/widgets/imagehero.dart';
import 'package:teg_auto/widgets/info_display.dart';


class CardPage extends StatefulWidget {
  const CardPage({super.key, required this.title, required this.data, required this.index});

  final String title;
  final ItemCard data;
  final int index;
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blue),
      body:  Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: size.height,
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
    ),);
  }
}