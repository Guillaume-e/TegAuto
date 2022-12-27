import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/widgets/vehicule_card.dart';

class SaleCard extends StatefulWidget {
  const SaleCard({Key? key, required this.listCard, required this.isSellList})
      : super(key: key);

  final List<Car> listCard;
  final bool isSellList;

  @override
  State<SaleCard> createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {
  void removeCarManagement(Car carToRemove) {
    final UserManagement connectedUser = context.read<UserManagement>();
    if (widget.isSellList == true) {
      connectedUser.removeSellCar(carToRemove);
      connectedUser.retrieveSellCar();
    } else {
      context.read<UserManagement>().removeFavoriteCar(carToRemove);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listCard.length,
      itemBuilder: (BuildContext context, int index) {
        final Car vehiculeCard = widget.listCard[index];
        return VehiculeCard(
          card: vehiculeCard,
          onPressed: () => removeCarManagement(vehiculeCard),
        );
      },
    );
  }
}
