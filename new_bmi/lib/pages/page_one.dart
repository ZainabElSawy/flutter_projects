import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageOne extends StatelessWidget {
  const PageOne({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "images/bmi.jpg",
        fit: BoxFit.fill,
        height: 300,
      ),
    );
  }
}
