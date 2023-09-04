import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  CustomButton({required this.text,required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27.0),
      ),
      elevation: 10,
      color: AppColor.primaryColor,
      onPressed: onPressed,
      child: Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 85, vertical: 18),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
