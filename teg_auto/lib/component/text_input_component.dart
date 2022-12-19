import 'package:flutter/material.dart';

class TextInputComponent extends StatefulWidget {
  const TextInputComponent({
    super.key,
    required this.hintText,
    required this.callback,
  });

  final String hintText;
  final void Function(String)? callback;

  @override
  State<TextInputComponent> createState() => _TextInputStateComponent();
}

class _TextInputStateComponent extends State<TextInputComponent> {
  void saveResponse(String text) {
    if (widget.callback != null) {
      widget.callback!(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: saveResponse,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
