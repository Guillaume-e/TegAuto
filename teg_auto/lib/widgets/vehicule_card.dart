import 'package:flutter/material.dart';
import 'package:teg_auto/classes/itemcard.dart';

var image = "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg";
class VehiculeCard extends StatelessWidget {

  const VehiculeCard({Key? key, required this.card, required this.onPressed}) : super(key: key);
  
  final ItemCard card;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
   return Container(
    margin:  const EdgeInsets.all(10),
    height: size.height * 0.18,
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), border: Border.all(width: 2)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(card.image, fit: BoxFit.fill, width: size.width * 0.38, height: size.height * 0.16)
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(
            card.brand,
            maxLines: 1,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            card.model,
            maxLines: 1,
            style: TextStyle(color: Colors.black,fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text(
            card.km + " km ",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            card.price + " €",
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
            ],
          ),
          ],
        ),
        IconButton(
            onPressed: onPressed,
            icon: const Icon(
            Icons.cancel,
            color: Colors.black,
            size: 50,
          ),
          ),

      ],
    ),
  );

   
  }
}