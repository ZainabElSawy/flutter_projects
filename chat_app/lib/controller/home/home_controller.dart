import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/core/services/services.dart';
import 'package:chat_app/view/screens/home/messages_screen.dart';
import 'package:chat_app/view/screens/home/users_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

abstract class HomeController extends GetxController {
  void onItemTapped(int index);
  logOut();
  editProfile();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = MyServices();
  SampleItem? selectedMenu;
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[
    const MessageScreen(),
    const UsersScreen(),
  ];
  List<String> titles = ["Messages", "Users"];
  final currentTime = DateTime.now();
  @override
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  @override
  editProfile() {
    Get.toNamed(AppRoutes.editProfile);
  }

  @override
  logOut() async {
    String formattedTime = DateFormat('hh:mm a').format(currentTime);
    myServices.sharedPreferences?.setString("login", "");
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection("users");
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference userDocRef = usersRef.doc(userId);
    await userDocRef.update({
      "isOnline": false,
      "lastSeen": formattedTime,
    });
    await FirebaseAuth.instance.signOut();
    Get.offNamed(AppRoutes.login);
    update();
  }
}
