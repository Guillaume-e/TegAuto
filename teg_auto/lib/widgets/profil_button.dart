import 'package:flutter/material.dart';

class ProfilButton extends StatefulWidget {

  const ProfilButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.color,
    required this.size,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;
  final Size size;

  @override
  State<ProfilButton> createState() => _ProfilButtonState();
}

class _ProfilButtonState extends State<ProfilButton> {
  bool _isPressed = false;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.3,
      height: widget.size.height * 0.06,
      child: ElevatedButton(

      style: ButtonStyle(
        backgroundColor: getColor( Colors.orange, Colors.blue),
      ),
      onPressed: () => {
        setState(() {
          _isPressed = !_isPressed;

        }),
        widget.onPressed
      },
      
      child: Text(widget.buttonText),
      ),
    );
  }
  
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    Color getColor(Set<MaterialState> states) {
      if (_isPressed == false) {
        return colorPressed;
      } else {
        return color;
      }
    }
    return MaterialStateProperty.resolveWith(getColor);
  }
}