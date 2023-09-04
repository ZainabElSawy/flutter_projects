import 'package:chat_app/model/chatmessage.dart';
import 'package:chat_app/model/chatuser.dart';
import 'package:chat_app/view/widgets/home/chat/messagebubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewAllMessagesInChat extends StatelessWidget {
  int listLength;
  List<ChatMessage> messages;
  ChatUser chatUser;
  bool isLoadingImg;
  ViewAllMessagesInChat(
      {required this.listLength,
      required this.messages,
      required this.chatUser,
      required this.isLoadingImg,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: listLength,
      itemBuilder: (context, index) {
        return messages[index].sender ==
                    FirebaseAuth.instance.currentUser!.email &&
                messages[index].recever == chatUser.email
            ? MessageBubble(
                type: "send",
                textMessage: messages[index].textMessage!,
                sendTime: messages[index].sendTime!,
                imgUrl: messages[index].imgUrl,
                isLoadingImg: isLoadingImg,
              )
            : messages[index].sender == chatUser.email &&
                    messages[index].recever ==
                        FirebaseAuth.instance.currentUser!.email
                ? MessageBubble(
                    type: "receve",
                    textMessage: messages[index].textMessage!,
                    sendTime: messages[index].sendTime!,
                    imgUrl: messages[index].imgUrl!,
                    isLoadingImg: isLoadingImg,
                  )
                : Container();
      },
    );
  }
}
