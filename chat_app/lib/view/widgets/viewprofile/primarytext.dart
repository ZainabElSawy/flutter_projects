import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  const PrimaryText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 30),
      ),
    );
  }
}
