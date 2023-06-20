import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "images/s1.jpg",
          fit: BoxFit.fill,
        ),
        const Text(
          "   Your Progess",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
          child: Text(
            "As a guide, an average man needs around 2,500kcal (10,500kj) a day to maintain a healthy body weight.",
            style: TextStyle(
              height: 1.5,
              color: Color.fromRGBO(154, 150, 150, 1),
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
