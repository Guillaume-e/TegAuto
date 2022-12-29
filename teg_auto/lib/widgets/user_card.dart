import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/model/user_list.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key, required this.card}) : super(key: key);

  final UserManagement? card;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    Widget buildImage() {
      return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: widget.card?.getImagePath().isEmpty == false
              ? Image.network(
                  widget.card!.getImagePath(),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                )
              : const Icon(Icons.account_circle_rounded, size: 100),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(10),
      height: 130,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildImage(),
          Text(
            widget.card?.getName() ?? "No name",
            maxLines: 1,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          IconButton(
            onPressed: () => context
                .read<UserManagementList>()
                .setNewUserToAdmin(widget.card),
            icon: widget.card?.getIsAdminStatus() == true
                ? const Icon(
                    Icons.cancel,
                    color: Colors.black,
                    size: 50,
                  )
                : const Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                    size: 50,
                  ),
          ),
        ],
      ),
    );
  }
}
