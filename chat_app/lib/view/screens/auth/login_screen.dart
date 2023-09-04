import 'package:chat_app/core/functions/alertexitapp.dart';
import 'package:chat_app/core/functions/validinput.dart';
import 'package:chat_app/view/widgets/auth/login_or_signup.dart';
import 'package:chat_app/view/widgets/auth/logo_auth.dart';
import 'package:chat_app/view/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../controller/auth/login_controller.dart';
import '../../widgets/consumauthtextfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LogInControllerImp>(
          builder: (ctr) => ModalProgressHUD(
            inAsyncCall: ctr.isLoading,
            child: SafeArea(
                child: Form(
              key: ctr.formstate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                child: ListView(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    LogoAuth(image: "images/smartphone.png"),
                    const SizedBox(height: 25),
                    ConsumAuthTextForm(
                      valid: (val) => validInput(val!, 10, 40, "email"),
                      icon: Icons.email_outlined,
                      ctr: ctr.emailController,
                      hintText: "Enter your email ...",
                      labelText: " Email",
                    ),
                    ConsumAuthTextForm(
                      isShowPass: ctr.isShowPassword,
                      onPressedIcon: () => ctr.showPassword(),
                      valid: (val) => validInput(val!, 6, 20, "password"),
                      icon: ctr.isShowPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      ctr: ctr.passController,
                      hintText: "Enter your password ...",
                      labelText: " Password",
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      text: "Sign In",
                      onPressed: () async {
                        await ctr.login();
                      },
                    ),
                    LoginOrSignUp(
                      text1: "Have not an account? ",
                      text2: "Sign Up",
                      onTap: () => ctr.goToSignUp(),
                    )
                  ],
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
