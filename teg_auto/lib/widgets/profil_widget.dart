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
  Widget buildName() => Column(
        children: <Widget>[
          Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            widget.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PickImage(imagePath: widget.imagePath),
          const SizedBox(height: 24),
          buildName(),
        ],
    );
  }

  }