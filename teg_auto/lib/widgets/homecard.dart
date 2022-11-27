import 'package:flutter/material.dart';
import 'package:teg_auto/classes/itemcard.dart';
import 'package:teg_auto/widgets/info_display.dart';
// import '../assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg' as bmw;

class HomeCard extends StatefulWidget {
  const HomeCard({super.key, required this.card});

  final ItemCard card;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
          return Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
                height: 350,
                width: 350,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: SizedBox(
                        height: 170,
                        width: 350,
                        child: Image.asset(widget.card.image, fit: BoxFit.cover,),
                    ),),
                    Positioned(
                      top: 140,
                      right: 30,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100)),
                        height: 57,
                        width: 57,
                        child: Image.asset('assets/images/tire (1).png', cacheHeight: 45, cacheWidth: 45,),
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
