import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LogoAuth extends StatelessWidget {
  String image;
  LogoAuth({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 180,
      height: 180,
    );
  }
}
