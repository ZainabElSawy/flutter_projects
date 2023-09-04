import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditOrAddImg extends StatelessWidget {
  IconData icon;
  Function()? onTap;
  EditOrAddImg({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColor.primaryColor,
        child: Icon(
          icon,
          color: AppColor.white,
        ),
      ),
    );
  }
}
