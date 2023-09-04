import 'package:chat_app/controller/home/home_controller.dart';
import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/view/widgets/customappbar.dart';
import 'package:chat_app/view/widgets/home/custombottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (ctr) => Scaffold(
        appBar: CustomAppBar(title: ctr.titles[ctr.selectedIndex]),
        body: Center(child: ctr.pages.elementAt(ctr.selectedIndex)),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: ctr.selectedIndex,
          onTap: ctr.onItemTapped,
          selectedItemColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}
