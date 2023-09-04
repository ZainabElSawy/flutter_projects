import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
ShowSnackBar(String title, String content) {
  return Get.snackbar(
    '',
    content,
    backgroundColor: AppColor.primaryColor.withOpacity(0.1),
    titleText: Text(
      title,
      style: const TextStyle(
          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    icon: const Icon(
      Icons.warning_amber_rounded,
      color: Colors.red,
    ),
    snackPosition: SnackPosition.TOP,
  );
}
