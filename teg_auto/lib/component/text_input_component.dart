import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class TextInputComponent extends StatefulWidget {
  const TextInputComponent({super.key});

  @override
  State<TextInputComponent> createState() => _TextInputStateComponent();
}

class _TextInputStateComponent extends State<TextInputComponent> {
  void saveResponse(String text) {
    developer.log("text entered $text");
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: saveResponse,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Nom',
      ),
    );
  }
}
