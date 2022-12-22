import 'package:flutter/material.dart';

class TextFormFieldCarSale extends StatefulWidget {
  const TextFormFieldCarSale(
    {super.key,
    required this.labelText,
    required this.textInputType,
    required this.maxLines,
    required this.callback,
    
    });
    
    final String? labelText;
    final int maxLines;
    final TextInputType textInputType;
    final void Function(String)? callback;

  @override
  State<TextFormFieldCarSale> createState() => _TextFormFieldCarSaleState();
}

class _TextFormFieldCarSaleState extends State<TextFormFieldCarSale> {
  void onChanged(String text) {
    if (widget.callback != null) {
      widget.callback!(text);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        onChanged: onChanged,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'This field is mandatory';
          }
          return null;
        },
        maxLines: widget.maxLines,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          labelText: widget.labelText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 4),
              borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}