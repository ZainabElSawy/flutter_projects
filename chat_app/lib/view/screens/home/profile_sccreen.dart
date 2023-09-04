import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/model/chatuser.dart';
import 'package:chat_app/view/widgets/customappbar.dart';
import 'package:chat_app/view/widgets/viewprofile/customiconbutton.dart';
import 'package:chat_app/view/widgets/viewprofile/info.dart';
import 'package:chat_app/view/widgets/viewprofile/primarytext.dart';
import 'package:chat_app/view/widgets/viewprofile/secondarytext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ChatUser chatUser = Get.arguments;
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              child: chatUser.imageUrl != null
                  ? CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(chatUser.imageUrl!),
                    )
                  : CircleAvatar(
                      radius: 90,
                      backgroundColor: AppColor.primaryColor.withOpacity(0.4),
                      child: Icon(
                        CupertinoIcons.person_solid,
                        size: 80,
                        color: AppColor.white,
                      ),
                    ),
            ),
            PrimaryText(text: chatUser.name!),
            SecondaryText(phone: chatUser.phone!),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomIconButton(
                    onTap: () =>
                        Get.toNamed(AppRoutes.chatScreen, arguments: chatUser),
                    icon: Icons.comment_outlined,
                  ),
                  CustomIconButton(icon: Icons.call),
                  CustomIconButton(icon: Icons.info),
                ],
              ),
            ),
            Info(title: "About", content: chatUser.aboutYou!),
            Info(title: "email", content: chatUser.email!),
            Info(title: "Created At", content: chatUser.createdAt!),
          ],
        ),
      ),
    );
  }
}
