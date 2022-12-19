import 'package:flutter/material.dart';
// import '../assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg' as bmw;

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    Key? key,
  }) : super(key: key);
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>  with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _colorAnimation;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      );
      _colorAnimation = ColorTween(begin: Colors.white, end: Colors.orange)
      .animate(_animationController);

      _animationController.addListener(() {
        setState((){});
      });

      _animationController.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFavorite = true;
          });
        }
        if (status == AnimationStatus.dismissed) {
          setState(() {
            isFavorite = false;
          });
        }
      });


  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        isFavorite ? _animationController.reverse() : _animationController.forward();
      },
      child: RotationTransition(
        turns: _animationController,
        child: Image.asset('assets/images/tire (1).png', cacheHeight: 45, cacheWidth: 45, color: _colorAnimation.value),
      ),
    );
  }
}