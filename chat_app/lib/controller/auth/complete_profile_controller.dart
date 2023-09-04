import 'dart:io';
import 'dart:math';

import 'package:chat_app/core/functions/showsnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/core/constant/routes.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

abstract class CompleteProfileController extends GetxController {
  goBack();
  successSignUp();
  uploadImage(String fromWhere);
  void setContainerFocused(bool focused);
}

class CompleteProfileControllerImp extends CompleteProfileController {
  TextEditingController name = TextEditingController();
  TextEditingController aboutyou = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? url;
  bool isLoadingImg = false;
  bool isFocused = FocusNode().hasFocus;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();


  @override
  void setContainerFocused(bool focused) {
    isFocused = focused;
    update();
  }

  @override
  uploadImage(String fromWhere) async {
    late File file;
    ImagePicker imagePicker = ImagePicker();
    var imagePicked = await imagePicker.pickImage(
        source:
            fromWhere == "camera" ? ImageSource.camera : ImageSource.gallery);
    if (imagePicked != null) {
        Get.back();
        isLoadingImg = true;
        update();
        file = File(imagePicked.path);
        var imageName = path.basename(imagePicked.path);
        var random = Random().nextInt(10000000);
        //Start upload image in firestorage
        var refStorage = FirebaseStorage.instance.ref("images/$random$imageName");
        await refStorage.putFile(file);
        //find the url of the image
        url = await refStorage.getDownloadURL();
        //return url;
        isLoadingImg = false;
        update();
      } else {
        isLoadingImg = false;
        update();
        ShowSnackBar("warning", "Please Choose Image!");
      }
  }

  @override
  successSignUp() async {
    final currentTime = DateTime.now();
    if (formstate.currentState!.validate()) {
      CollectionReference usersRef =
          FirebaseFirestore.instance.collection("users");
      String userId = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference userDocRef = usersRef.doc(userId);

      await userDocRef.set({
        "userId": userId,
        "email": FirebaseAuth.instance.currentUser!.email,
        "name": name.text,
        "aboutYou": aboutyou.text,
        "phone": phone.text,
        "imageUrl": url,
        "createdAt":
            "${currentTime.day}-${currentTime.month}-${currentTime.year}",
        "isOnline": false,
        "lastSeen": "",
      });
      Get.offNamed(AppRoutes.successSignUp);
    }
  }

  @override
  goBack() {
    Get.back();
  }
}
