import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/core/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  cont();
  goToLogin();
  showPassword();
  showConfirmPass();
}

class SignupControllerImp extends SignupController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isLoading = false;
  bool isShowPassword = true;
  bool isShowConfirmPass = true;

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
    update();
  }
  @override
  cont() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      update();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        Get.offNamed(AppRoutes.completeProfile);
        isLoading = false;
        update();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          isLoading = false;
          update();
          Get.snackbar(
            '',
            'The password provided is too weak.',
            backgroundColor: AppColor.primaryColor.withOpacity(0.1),
            titleText: const Text(
              "Warning",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            icon: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
            ),
            snackPosition: SnackPosition.TOP,
          );
          //print('**********The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          isLoading = false;
          update();
          Get.snackbar(
            '',
            'The account already exists for that email.',
            backgroundColor: AppColor.primaryColor.withOpacity(0.1),
            titleText: const Text(
              "Warning",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            icon: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
            ),
            snackPosition: SnackPosition.TOP,
          );
          //print('The account already exists for that email.');
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
      update();
    }
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  showConfirmPass() {
    isShowConfirmPass = !isShowConfirmPass;
    update();
  }
}
