import 'package:flutter/material.dart';
import 'package:login_messanger/chats.dart';
import 'package:login_messanger/people.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: currentIndex == 0 ? const Chats() : const People(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: const [
                      Icon(
                        Icons.chat_bubble,
                        size: 35,
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                        child: Text(
                          '11',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      )
                    ]),
                label: 'Chats'),
            BottomNavigationBarItem(
                icon: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    const Icon(
                      Icons.people,
                      size: 35,
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: const Text(
                        '99+',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                label: 'People')
          ]),
    );
  }
}
