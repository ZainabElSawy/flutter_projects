import 'package:chat_app/controller/auth/signup_controller.dart';
import 'package:chat_app/core/functions/alertexitapp.dart';
import 'package:chat_app/core/functions/validinput.dart';
import 'package:chat_app/view/widgets/auth/login_or_signup.dart';
import 'package:chat_app/view/widgets/auth/logo_auth.dart';
import 'package:chat_app/view/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widgets/consumauthtextfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerImp());
    return Scaffold(
        body: WillPopScope(
      onWillPop: alertExitApp,
      child: GetBuilder<SignupControllerImp>(
        builder: (controller) => ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: SafeArea(
            child: Form(
              key: controller.formstate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                child: ListView(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    LogoAuth(image: "images/smartphone.png"),
                    const SizedBox(height: 25),
                    ConsumAuthTextForm(
                      valid: (val) => validInput(val!, 10, 40, "email"),
                      icon: Icons.email_outlined,
                      ctr: controller.emailController,
                      hintText: "Enter your email ...",
                      labelText: " Email",
                    ),
                    ConsumAuthTextForm(
                      isShowPass: controller.isShowPassword,
                      onPressedIcon: () => controller.showPassword(),
                      valid: (val) => validInput(val!, 6, 20, "password"),
                      icon: controller.isShowPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      ctr: controller.passController,
                      hintText: "Enter your password ...",
                      labelText: " Password",
                    ),
                    ConsumAuthTextForm(
                      isShowPass: controller.isShowConfirmPass,
                      onPressedIcon: () => controller.showConfirmPass(),
                      valid: (val) {
                        if (val != controller.passController.text) {
                          return "Confirm password not equal to password";
                        }
                        return null;
                      },
                      icon: controller.isShowConfirmPass
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      ctr: controller.confirmPassController,
                      hintText: "Confirm password ...",
                      labelText: " Confirm password",
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      text: "Sign Up",
                      onPressed: () async => await controller.cont(),
                    ),
                    LoginOrSignUp(
                      text1: "Have an account? ",
                      text2: "Sign In",
                      onTap: () => controller.goToLogin(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
