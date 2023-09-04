import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/model/chatuser.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CardUsers extends StatelessWidget {
  ChatUser chatUser;
  String? sendtime;
  String? lastMessage;
  CardUsers({
    required this.chatUser,
    this.sendtime,
    this.lastMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.chatScreen, arguments: chatUser),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: chatUser.imageUrl != null
                ? CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(chatUser.imageUrl!))
                : CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    radius: 25,
                    child: Icon(
                      CupertinoIcons.person,
                      size: 30,
                      color: AppColor.white,
                    ),
                  ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                      chatUser.email == FirebaseAuth.instance.currentUser!.email
                          ? "Me (you)."
                          : chatUser.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  const Spacer(),
                  lastMessage != null
                      ? (chatUser.isOnline == null
                          ? Container()
                          : chatUser.isOnline == true
                              ? const Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 5,
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      "Online",
                                      style: TextStyle(color: Colors.green),
                                    )
                                  ],
                                )
                              : Text(
                                  "last seen ${chatUser.lastSeen!}",
                                  style: TextStyle(color: AppColor.grey),
                                ))
                      : Container()
                ],
              ),
            ),
            subtitle: Row(
              children: [
                lastMessage != null
                    ? Text(
                        lastMessage!,
                        maxLines: 1,
                      )
                    : Text(
                        chatUser.aboutYou!,
                        maxLines: 1,
                      ),
                const Spacer(),
                sendtime != null
                    ? Text(
                        sendtime!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 15),
                      )
                    : Container()
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 65),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
