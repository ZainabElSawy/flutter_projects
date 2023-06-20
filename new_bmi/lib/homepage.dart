import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_bmi/pages/page_one.dart';
import 'package:new_bmi/pages/page_three.dart';
import 'package:new_bmi/pages/page_two.dart';

import 'pages/input_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> pages =const [
    PageOne(),
    PageTwo(),
    PageThree(),
  ];
  int _currentPageIndex = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      final int nextPageIndex = (_currentPageIndex + 1) % pages.length;
      _pageController.animateToPage(
        nextPageIndex,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              PageView(
                controller: _pageController,
                children: pages,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: _currentPageIndex == 0
                                ? const Color.fromRGBO(50, 184, 143, 1)
                                : const Color.fromRGBO(217, 217, 217, 1),
                            radius: 4),
                        const SizedBox(width: 10),
                        CircleAvatar(
                            backgroundColor: _currentPageIndex == 1
                                ? const Color.fromRGBO(50, 184, 143, 1)
                                : const Color.fromRGBO(217, 217, 217, 1),
                            radius: 4),
                        const SizedBox(width: 10),
                        CircleAvatar(
                            backgroundColor: _currentPageIndex == 2
                                ? const Color.fromRGBO(50, 184, 143, 1)
                                : const Color.fromRGBO(217, 217, 217, 1),
                            radius: 4),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 112, 213, 183),
                            Color.fromARGB(255, 14, 153, 111),
                          ],
                          stops: [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      padding: const EdgeInsets.only(
                        right: 15.0,
                        left: 15.0,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InputPage()),
                          );
                        },
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          left: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              "Start  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                              size: 28,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }
}
