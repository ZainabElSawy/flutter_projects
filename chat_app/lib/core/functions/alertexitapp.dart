import 'dart:io';

import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.dialog<bool>(
    AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        width: double.infinity,
        color: AppColor.primaryColor.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.exit_to_app_sharp, size: 30, color: AppColor.white),
            Text(
              "Exit app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColor.white,
              ),
            ),
            Text(
              "Are you sure to exit app?",
              style: TextStyle(
                fontSize: 15,
                color: AppColor.white,
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor.withOpacity(0.5),
              foregroundColor: AppColor.white,
              textStyle: const TextStyle(fontSize: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            onPressed: () {
              exit(0);
            },
            child: const Text("Confirm")),
        MaterialButton(
          padding: const EdgeInsets.only(left: 20),
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: AppColor.primaryColor.withOpacity(0.5)),
          ),
        ),
      ],
    ),
  );
  return Future.value(true);
}
