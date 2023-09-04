import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Info extends StatelessWidget {
  String title;
  String content;
  Info({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 5),
          Text(
            content,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
