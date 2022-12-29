import 'package:flutter/material.dart';
import 'package:teg_auto/model/car.dart';

String image =
    "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg";

class VehiculeCard extends StatelessWidget {
  const VehiculeCard({Key? key, required this.card, required this.onPressed})
      : super(key: key);

  final Car card;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
   
    return Center(
      child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      height: size.width < size.height ? size.height * 0.18 : size.height * 0.25,
      width:  size.width > size.height ? size.width * 0.55 : size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              card.image,
              fit: BoxFit.cover,
              width: size.width > size.height ? size.width * 0.25 : size.width *0.38,
              height: size.width > size.height ? size.height *0.8 : size.height * 0.16,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace,) {
                return Icon(Icons.car_crash, size: size.width > size.height ? size.height * 0.15 : size.height * 0.12);
              },
            ),
          ),
          ConstrainedBox(
             constraints: BoxConstraints(
                  maxWidth: size.width > size.height ? size.width * 0.14 : size.width * 0.40,),
                  child: 
          
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  card.brand,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: size.height * 0.03),
                ),
              
            Text(
                  card.model,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize:  size.height * 0.03),
                  ),
                
                 Text(
                  "${card.price} €",
                   maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:  size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                
              ),
            ],
          ),
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
    ),
    );
  
  }
}
