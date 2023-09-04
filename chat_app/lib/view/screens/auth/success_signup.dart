import 'package:chat_app/controller/auth/success_signup_controller.dart';
import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/view/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSigupControllerImp controller = Get.put(SuccessSigupControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
            const SizedBox(height: 20),
            Text(
              "Congratulations",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              "Successfully Registered",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16),
            ),
            const Spacer(),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                child: CustomButton(
                    text: "Go to login",
                    onPressed: () {
                      controller.goToLogin();
                    })),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
