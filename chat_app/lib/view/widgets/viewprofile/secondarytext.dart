import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  final String phone;
  const SecondaryText({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        "+20 $phone",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
