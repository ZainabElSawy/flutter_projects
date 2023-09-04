import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
ShowBottomSheet(BuildContext context,Function()? onTapCam,Function()? onTapGal) {
  Get.bottomSheet(
    Container(
      height: 200,
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose profile Image',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 20),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: onTapCam,
                    child: CircleAvatar(
                      backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                      radius: 50,
                      child: const Icon(
                        Icons.camera,
                        size: 50,
                      ),
                    ),
                  ),
                  const Text("Camera")
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: onTapGal,
                    child: CircleAvatar(
                      backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                      radius: 50,
                      child: const Icon(
                        Icons.photo,
                        size: 50,
                      ),
                    ),
                  ),
                  const Text("Gallery"),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
