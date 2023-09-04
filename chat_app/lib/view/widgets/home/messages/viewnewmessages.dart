import 'package:chat_app/model/chatuser.dart';
import 'package:chat_app/model/lastmessage.dart';
import 'package:chat_app/view/widgets/home/users/cardusers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewNewMessages extends StatelessWidget {
  Future<Object?>? future;
  LastMessage lastMessage;
  ViewNewMessages({required this.future, required this.lastMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return snapshot.data != "No"
                ? CardUsers(
                    chatUser: snapshot.data as ChatUser,
                    lastMessage: lastMessage.sender ==
                            FirebaseAuth.instance.currentUser!.email
                        ? ("you: ${lastMessage.lastMessage}")
                        : lastMessage.lastMessage,
                    sendtime: lastMessage.sendTime,
                  )
                : Container();
          }
        });
  }
}
