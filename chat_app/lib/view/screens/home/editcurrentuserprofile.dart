import 'package:chat_app/controller/home/editcurrentuserprofilecontroller.dart';
import 'package:chat_app/core/functions/alertexitapp.dart';
import 'package:chat_app/core/functions/showbottomsheet.dart';
import 'package:chat_app/core/functions/validinput.dart';
import 'package:chat_app/view/widgets/consumauthtextfield.dart';
import 'package:chat_app/view/widgets/customappbar.dart';
import 'package:chat_app/view/widgets/custombutton.dart';
import 'package:chat_app/view/widgets/profilecomplete/costum_auth_phonefield.dart';
import 'package:chat_app/view/widgets/profilecomplete/edit_or_add_img.dart';
import 'package:chat_app/view/widgets/profilecomplete/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCurrentUserProfile extends StatelessWidget {
  const EditCurrentUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    EditCurrentUserProfileControllerImp controller =
        Get.put(EditCurrentUserProfileControllerImp());
    return Scaffold(
      appBar: const CustomAppBar(title: "Edit Profile"),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
              key: controller.formstate,
              child: FutureBuilder<dynamic>(
                  future: controller.currentUserData(),
                  builder: (context, snapshot) {
                    return ListView(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          GetBuilder<EditCurrentUserProfileControllerImp>(
                            builder: (ctr) => ProfileImage(
                                imgUrl: ctr.imgUrl,
                                isLoading: controller.isLoading),
                          ),
                          Positioned(
                            bottom: 0,
                            right: MediaQuery.of(context).size.width * 0.27,
                            child: EditOrAddImg(
                                icon: Icons.edit,
                                onTap: () => ShowBottomSheet(
                                      context,
                                      () => controller.uploadImage("camera"),
                                      () => controller.uploadImage("gallary"),
                                    )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ConsumAuthTextForm(
                          valid: (val) => validInput(val!, 10, 30, "name"),
                          hintText: "Edit user name ...",
                          labelText: "user name",
                          ctr: controller.name,
                          icon: Icons.person),
                      ConsumAuthTextForm(
                          valid: (val) => validInput(val!, 10, 40, "about you"),
                          hintText: "Write something about you...",
                          labelText: "About you",
                          ctr: controller.aboutYou,
                          icon: Icons.info_outline),
                      const SizedBox(height: 10),
                      GetBuilder<EditCurrentUserProfileControllerImp>(
                        builder: (ctr) => CostumAuthPhoneField(
                          phone: controller.phone,
                          isFocused: ctr.isFocused,
                          onFocusChange: (hasFocus) =>
                              ctr.setContainerFocused(hasFocus),
                        ),
                      ),
                      const SizedBox(height: 40),
                      GetBuilder<EditCurrentUserProfileControllerImp>(
                        builder: (ctr2) => CustomButton(
                          text: "Update",
                          onPressed: () async => await ctr2.updateUsersInfo(),
                        ),
                      )
                    ]);
                  })),
        ),
      ),
    );
  }
}
