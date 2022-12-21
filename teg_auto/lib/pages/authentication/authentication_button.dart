import 'package:flutter/material.dart';

class AuthenticationButton extends StatefulWidget {
  const AuthenticationButton({
    super.key,
    required this.name,
    required this.backgroundColor,
    required this.textColor,
    required this.componentFunction,
  });

  final String name;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? componentFunction;

  @override
  State<AuthenticationButton> createState() => _AuthenticationButtonState();
}

class _AuthenticationButtonState extends State<AuthenticationButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.componentFunction,
      child: Card(
        elevation: 1,
        color: widget.backgroundColor,
        shape: const RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: widget.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
