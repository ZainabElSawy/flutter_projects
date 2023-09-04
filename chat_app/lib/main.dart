import 'package:chat_app/core/constant/apptheme.dart';
import 'package:chat_app/core/services/services.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MessageMe app',
      theme: appTheme,
      getPages: routes,
    );
  }
}
