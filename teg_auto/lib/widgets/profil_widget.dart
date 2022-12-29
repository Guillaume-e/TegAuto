import 'package:flutter/material.dart';
import 'package:teg_auto/widgets/pick_image.dart';

class ProfileWidget extends StatefulWidget {

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.email,
  }) : super(key: key);
  final String imagePath;
  final String name;
  final String email;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  
  Widget buildName(Size size) => Column(
        children: <Widget>[
          Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.04),
          ),
          SizedBox(height: size.height * 0.015),
          Text(
            widget.email,
            style: TextStyle(color: Colors.grey, fontSize: size.height * 0.02),
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
        final Size size = MediaQuery.of(context).size;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PickImage(imagePath: widget.imagePath),
          const SizedBox(height: 24),
          buildName(size),
        ],
    );
  }

  }