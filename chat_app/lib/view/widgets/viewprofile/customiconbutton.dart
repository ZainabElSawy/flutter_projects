import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  Function()? onTap;
  IconData icon;
  CustomIconButton({ this.onTap, required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 28,
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            color: AppColor.white,
            icon,
            size: 25,
          ),
        ),
      ),
    );
  }
}
