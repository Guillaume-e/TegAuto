import 'package:flutter/material.dart';

class ImageHero extends StatelessWidget {
    const ImageHero({ Key? key, required this.tag, required this.onTap, required this.image, required this.height, required this.width,}) : super(key: key);

  final String tag;
  final VoidCallback onTap;
  final String image;
  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    return Hero(
       tag: tag,
        child: Material(
          color: Colors.transparent,
          child:  InkWell(
          onTap: onTap,
          splashColor: Colors.white10, // Splash color over image
          child:
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: height,
                width: width,
                child: Image.asset(image, fit: BoxFit.cover,),
          ),),
      ),),
    );
  }
}