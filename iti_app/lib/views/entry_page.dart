import 'package:flutter/material.dart';
import 'package:iti_app/views/page_one.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar/nav_bar_page.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    isLoading = false;
    nextPage();
  }

  nextPage() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = await prefs.getString('email');
    if (value == null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageOne()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavBarPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
