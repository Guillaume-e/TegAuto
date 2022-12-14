import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/car_list.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/model/user_return.dart';
import 'package:teg_auto/widgets/empty_card.dart';
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
  void removeCarManagement(Car carToRemove) async {
    final ScaffoldMessengerState scaffoldUserMessage =
        ScaffoldMessenger.of(context);
    final UserManagement connectedUser = context.read<UserManagement>();
    late UserReturn removeResponse;
    if (widget.isSellList == true) {
      if (context.read<UserManagement>().getIsAdminStatus() == true) {
        removeResponse = await context
            .read<CarsList>()
            .removeCarInUserSellListIfAdmin(carToRemove);
      } else {
        removeResponse = await connectedUser.removeSellCar(carToRemove);
      }
      connectedUser.retrieveSellCar();
    } else {
      removeResponse = await connectedUser.removeFavoriteCar(carToRemove);
      connectedUser.retrieveFavoriteCar();
    }
    scaffoldUserMessage
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(removeResponse.message)),
      );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listCard.isEmpty) {
      return EmptyCard(
        text: widget.isSellList
            ? "You don't sell car"
            : "You don't have favorite sell",
      );
    } else {
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
}
