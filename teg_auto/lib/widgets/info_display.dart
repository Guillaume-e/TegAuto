import 'package:flutter/material.dart';

class InfoDisplay extends StatefulWidget {
  const InfoDisplay({super.key, required this.text});

  final String text;

  @override
  State<InfoDisplay> createState() => _InfoDisplayState();
}

class _InfoDisplayState extends State<InfoDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(50)),
      child: Center(child: Text(widget.text, style: const TextStyle(fontSize: 22),)),
    );
  }
}