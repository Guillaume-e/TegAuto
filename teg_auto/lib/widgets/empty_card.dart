import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({
    Key? key,
    required this.text,

  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Icon(
            Icons.highlight_off_rounded,
            size: 70,
          ),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}