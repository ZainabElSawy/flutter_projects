import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/model/chatuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersImages extends StatelessWidget {
  const UsersImages({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatUser> list = [];
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .orderBy("name")
          .snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              final data = snapshot.data?.docs;
              list =
                  data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];
              return ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return list[index].imageUrl != null &&
                          list[index].isOnline == true &&
                          list[index].email !=
                              FirebaseAuth.instance.currentUser!.email
                      ? InkWell(
                          onTap: () => Get.toNamed(AppRoutes.chatScreen,
                              arguments: list[index]),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              width: 70,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage:
                                            NetworkImage(list[index].imageUrl!),
                                      ),
                                      Positioned(
                                          bottom: -1,
                                          right: -1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColor.white,
                                                    width: 2.5)),
                                            child: const CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Colors.green,
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 1),
                                  Text(
                                    list[index].name!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container();
                },
              );
            }
        }
        return Container();
      },
    );
  }
}
