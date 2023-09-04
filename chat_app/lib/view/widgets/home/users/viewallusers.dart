import 'package:chat_app/model/chatuser.dart';
import 'package:chat_app/view/widgets/home/users/cardusers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewAllUsers extends StatelessWidget {
  int listLength;
  List<ChatUser> users;
  ViewAllUsers({required this.listLength, required this.users, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listLength,
      itemBuilder: (context, index) {
        return InkWell(
          child: CardUsers(chatUser: users[index]),
        );
      },
    );
  }
}
