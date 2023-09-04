import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/model/chatuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  ChatUser chatUser;
  CustomChatAppBar({required this.chatUser, super.key});
  @override
  Size get preferredSize => const Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 20,
      toolbarHeight: 70,
      elevation: 3,
      backgroundColor: AppColor.white,
      title: GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.profileScreen, arguments: chatUser),
        child: ListTile(
          leading: Stack(
            children: [
              chatUser.imageUrl == null
                  ? CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      radius: 22,
                      child: Icon(
                        CupertinoIcons.person,
                        color: AppColor.white,
                        size: 25,
                      ),
                    )
                  : CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(chatUser.imageUrl!),
                    ),
              Positioned(
                bottom: -2,
                right: -2,
                child: chatUser.isOnline == true
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColor.white, width: 2.5)),
                        child: const CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.green,
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              chatUser.name!,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: chatUser.isOnline!
              ? Text(
                  "Online",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.green),
                )
              : Text(
                  "last seen at ${chatUser.lastSeen}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
            size: 28,
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.video_camera,
              color: AppColor.grey,
              size: 35,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.phone,
              color: AppColor.grey,
              size: 27,
            )),
        const SizedBox(width: 5)
      ],
    );
  }
}
