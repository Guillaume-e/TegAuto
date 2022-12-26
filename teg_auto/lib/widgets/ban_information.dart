import 'package:flutter/material.dart';
import 'package:teg_auto/widgets/user_card.dart';

class BanCard extends StatefulWidget {
  const BanCard({
    Key? key,
    required this.listCard,
  }) : super(key: key);
  final List<List<String>> listCard;

  @override
  State<BanCard> createState() => _BanCardState();
}

class _BanCardState extends State<BanCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listCard.length,
      itemBuilder: (BuildContext context, int index) {
        final List<String> userCard = widget.listCard[index];
        return UserCard(card: userCard, onPressed: () => "toto");
      },
    );
  }
}
