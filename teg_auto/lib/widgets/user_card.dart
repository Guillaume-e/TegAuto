import 'package:flutter/material.dart';
import 'package:teg_auto/model/itemcard.dart';
import 'package:teg_auto/model/user.dart';

String image = "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg";
class UserCard extends StatelessWidget {

  const UserCard({Key? key, required this.card, required this.onPressed}) : super(key: key);
  
  final List<String> card;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
   return Container(
    margin:  const EdgeInsets.all(10),
    height: 130,
    width: 200,
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), border: Border.all(width: 2)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(card[0], fit: BoxFit.cover, width: size.width * 0.38, height: size.height * 0.16),
      ),
      Text(
        card[1],
        maxLines: 1,
        style: const TextStyle(color: Colors.black, fontSize: 16),
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