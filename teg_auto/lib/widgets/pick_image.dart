import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {

  const PickImage({
    Key? key,
    required this.imagePath,

  }) : super(key: key);
  final String imagePath;


  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
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
  }
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
          
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: kIsWeb
        ? _imageFile != null ? Image.network(_imageFile!.path, fit: BoxFit.cover, width: 140, height: 140) : const Icon(Icons.account_circle_rounded, size: 130,)
        : _imageFile != null ? Image.file(File(_imageFile!.path), fit: BoxFit.cover, width: 140, height: 140) : const Icon(Icons.account_circle_rounded, size: 130),

      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 1,
          child: IconButton(
            onPressed: () {
               _onImageButtonPressed(ImageSource.gallery, context: context);
            },
            icon: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}