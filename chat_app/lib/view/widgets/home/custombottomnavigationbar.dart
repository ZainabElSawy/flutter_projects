import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Color selectedItemColor;
  void Function(int) onTap;
  CustomBottomNavBar(
      {required this.currentIndex,
      required this.onTap,
      required this.selectedItemColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_fill),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person_2_fill),
          label: 'Users',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
      onTap: onTap,
    );
  }
}
