import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/model/user_list.dart';
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
    final UserManagementList managementListRef =
        context.watch<UserManagementList>();
    return FutureBuilder<List<UserManagement>>(
      future: managementListRef.retrieveAllUserInDatabase(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<UserManagement>> snapshot,
      ) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              final UserManagement? userCard = snapshot.data?[index];
              return UserCard(card: userCard);
            },
          );
        } else if (snapshot.hasError) {
          return const Text("Error in data");
        } else {
          return const Text("No data");
        }
      },
    );
  }
}
