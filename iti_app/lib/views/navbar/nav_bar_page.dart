import 'package:flutter/material.dart';
import 'package:iti_app/views/navbar/pages/home.dart';
import 'package:iti_app/views/navbar/pages/posts.dart';
import 'package:iti_app/views/navbar/pages/profile.dart';
import 'package:iti_app/views/navbar/pages/setting.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int currentIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    PostsPage(),
    SettingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentIndex == 0
            ? 'Posts'
            : currentIndex == 1
                ? 'Setting'
                : 'Profile'),
        centerTitle: true,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.post_add_sharp), label: "Posts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile")
          ]),
    );
  }
}
