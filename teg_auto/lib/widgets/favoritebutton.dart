import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/user.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.carSelected});

  final Car carSelected;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<dynamic> _colorAnimation;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    final UserManagement connectedUser = context.read<UserManagement>();
    isFavorite = connectedUser.isCarFavorite(widget.carSelected);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.orange)
        .animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
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
    if (isFavorite == true) _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void manageAnimation() {
    final UserManagement user = context.read<UserManagement>();
    if (isFavorite == true) {
      _animationController.reverse();
      user.removeFavoriteCar(widget.carSelected);
    } else {
      _animationController.forward();
      user.addFavoriteCar(widget.carSelected);
    }
    user.retrieveFavoriteCar();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: manageAnimation,
      child: RotationTransition(
        turns: _animationController,
        child: Image.asset(
          'assets/images/tire (1).png',
          cacheHeight: 45,
          cacheWidth: 45,
          color: _colorAnimation.value,
        ),
      ),
    );
  }
}
