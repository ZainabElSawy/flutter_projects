import 'package:chat_app/core/functions/showsnackbar.dart';
import 'package:chat_app/core/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class LogInController extends GetxController {
  login();
  goToSignUp();
  showPassword();
}

class LogInControllerImp extends LogInController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isLoading = false;
  bool isShowPassword = true;
  MyServices myServices = Get.find();

  @override
  showPassword() {
    isShowPassword = isShowPassword ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      update();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        myServices.sharedPreferences?.setString("login", emailController.text);
        CollectionReference usersRef =
            FirebaseFirestore.instance.collection("users");
        String userId = FirebaseAuth.instance.currentUser!.uid;
        DocumentReference userDocRef = usersRef.doc(userId);
        await userDocRef.update({
          "isOnline": true,
          "lastSeen": "",
        });
        update();
        Get.offNamed(AppRoutes.home);
        isLoading = false;
        update();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          isLoading = false;
          ShowSnackBar("Warning", 'No user found for that email.');
          update();
          // print('***********No user found for that email.');
        } else if (e.code == 'wrong-password') {
          isLoading = false;
          ShowSnackBar("Warning", 'Wrong password provided for that user.');
          update();
          // print('***************Wrong password provided for that user.');
        }
      } catch (e) {
        // ignore: avoid_print
        print("Errrrrror $e");
      }
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
    update();
  }
}
