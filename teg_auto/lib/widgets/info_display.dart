import 'package:flutter/material.dart';

class InfoDisplay extends StatefulWidget {
  const InfoDisplay({super.key, required this.text, required this.height, required this.width, required this.fontSize});

  final String text;
  final double height;
  final double width;
  final double fontSize;

  @override
  State<InfoDisplay> createState() => _InfoDisplayState();
}

class _InfoDisplayState extends State<InfoDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(50)),
        child: Center(child: Text(widget.text, style: TextStyle(fontSize: widget.fontSize), textAlign: TextAlign.center,)),
    );
  }
}