import 'package:chat_app/controller/auth/complete_profile_controller.dart';
import 'package:chat_app/core/functions/alertexitapp.dart';
import 'package:chat_app/core/functions/showbottomsheet.dart';
import 'package:chat_app/core/functions/validinput.dart';
import 'package:chat_app/view/widgets/consumauthtextfield.dart';
import 'package:chat_app/view/widgets/profilecomplete/costum_auth_phonefield.dart';
import 'package:chat_app/view/widgets/profilecomplete/edit_or_add_img.dart';
import 'package:chat_app/view/widgets/profilecomplete/profile_image.dart';
import 'package:chat_app/view/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    CompleteProfileControllerImp controller =
        Get.put(CompleteProfileControllerImp());

    return Scaffold(
      // appBar: const CustomAppBar(title: "Complete Profile"),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Stack(
                alignment: Alignment.center,
                children: [
                  GetBuilder<CompleteProfileControllerImp>(
                      builder: (ctr) => ProfileImage(
                          imgUrl: ctr.url, isLoading: ctr.isLoadingImg)),
                  Positioned(
                    bottom: 0,
                    right: MediaQuery.of(context).size.width * 0.27,
                    child: EditOrAddImg(
                      icon: Icons.add_a_photo,
                      onTap: () => ShowBottomSheet(
                        context,
                        () => controller.uploadImage("camera"),
                        () => controller.uploadImage("gallary"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ConsumAuthTextForm(
                  valid: (val) => validInput(val!, 10, 30, "name"),
                  hintText: "Enter user name ...",
                  labelText: "user name",
                  ctr: controller.name,
                  icon: Icons.person),
              ConsumAuthTextForm(
                  valid: (val) => validInput(val!, 10, 40, "about you"),
                  hintText: "Write something about you...",
                  labelText: "About you",
                  ctr: controller.aboutyou,
                  icon: Icons.info_outline),
              const SizedBox(height: 10),
              GetBuilder<CompleteProfileControllerImp>(
                builder: (ctr) => CostumAuthPhoneField(
                  phone: controller.phone,
                  isFocused: ctr.isFocused,
                  onFocusChange: (hasFocus) =>
                      ctr.setContainerFocused(hasFocus),
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: "Continue",
                onPressed: () async => await controller.successSignUp(),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
