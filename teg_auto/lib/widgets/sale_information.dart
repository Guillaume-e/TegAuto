import 'package:flutter/material.dart';
import 'package:teg_auto/model/itemcard.dart';
import 'package:teg_auto/widgets/vehicule_card.dart';

class SaleCard extends StatefulWidget {

  const SaleCard({
    Key? key,
    required this.listCard

  }) : super(key: key);
  final List<ItemCard> listCard;

  @override
  State<SaleCard> createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listCard.length,
      itemBuilder: (BuildContext context, int index) {
        final ItemCard vehiculeCard = widget.listCard[index];
        return VehiculeCard(card: vehiculeCard, onPressed: () => "toto");
      },
    );
  }
}