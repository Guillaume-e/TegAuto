import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageCarSale extends StatefulWidget {

  const PickImageCarSale({
    super.key,
    required this.callback,
  });
  final void Function(String)? callback;

  @override
  State<PickImageCarSale> createState() => _PickImageCarSaleState();
}

class _PickImageCarSaleState extends State<PickImageCarSale> {
   XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();



  void _setImageFile(XFile? value) {
    _imageFile = value;
  }

  Future<void> _onImageButtonPressed(ImageSource source, {BuildContext? context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );
      setState(() {
        _setImageFile(pickedFile);
      });
    } catch (e) {
      setState(() {
      });
    }
    if (_imageFile?.path != null) {
      widget.callback!(_imageFile!.path);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage() {
    final Size size = MediaQuery.of(context).size;
    return ClipRect(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            _onImageButtonPressed(ImageSource.gallery, context: context);
          }, 
          child: kIsWeb
          ? _imageFile != null ? Image.network(_imageFile!.path, fit: BoxFit.cover, width: size.width * 0.9, height: size.height * 0.4,) : const Icon(Icons.camera_alt_rounded, size: 150,)
          : _imageFile != null ? Image.file(File(_imageFile!.path), fit: BoxFit.cover, width: size.width *0.9, height: size.height * 0.4) : const Icon(Icons.camera_alt_rounded, size: 150),
        ),
      ),
    );
  }
}