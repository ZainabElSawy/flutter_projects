import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/core/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences?.getString("onboarding") == "1") {
      if (myServices.sharedPreferences?.getString("login") ==
          FirebaseAuth.instance.currentUser!.email) {
        return const RouteSettings(name: AppRoutes.home);
      }
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
