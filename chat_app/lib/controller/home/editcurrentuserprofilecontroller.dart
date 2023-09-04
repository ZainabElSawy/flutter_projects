import 'dart:io';
import 'dart:math';

import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/core/functions/showsnackbar.dart';
import 'package:chat_app/model/chatuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

abstract class EditCurrentUserProfileController extends GetxController {
  currentUserData();
  uploadImage(String fromWhere);
  void setContainerFocused(bool focused);
  updateUsersInfo();
}

class EditCurrentUserProfileControllerImp
    extends EditCurrentUserProfileController {
  User? currentUser = FirebaseAuth.instance.currentUser;
  ChatUser userData = ChatUser();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isLoading = false;
  String? imgUrl;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController aboutYou = TextEditingController();
  bool isFocused = FocusNode().hasFocus;

  @override
  void setContainerFocused(bool focused) {
    isFocused = focused;
    update();
  }

  @override
  currentUserData() async {
    QuerySnapshot snapshot1 = await FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: currentUser!.email)
        .limit(1)
        .get();

    if (snapshot1.docs.isNotEmpty) {
      DocumentSnapshot document = snapshot1.docs.first;
      userData = ChatUser.fromJson(document.data() as Map<String, dynamic>);
      imgUrl = userData.imageUrl;
      name.text = userData.name!;
      phone.text = userData.phone!;
      aboutYou.text = userData.aboutYou!;
      update();
      return {
        "imgUrl": imgUrl,
        "name": name,
        "phone": phone,
        "aboutyou": aboutYou,
      };
    }
    return "No";
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
      isLoading = true;
      imgUrl = null;
      update();
      file = File(imagePicked.path);
      var imageName = path.basename(imagePicked.path);
      var random = Random().nextInt(10000000);
      var refStorage = FirebaseStorage.instance.ref("images/$random$imageName");
      await refStorage.putFile(file);
      imgUrl = await refStorage.getDownloadURL();
      isLoading = false;
      update();
    } else {
      isLoading = false;
      ShowSnackBar("warning", "Please Choose Image!");
      update();
    }
  }

  @override
  updateUsersInfo() async {
    if (formstate.currentState!.validate()) {
      try {
        CollectionReference usersRef =
            FirebaseFirestore.instance.collection("users");
        String userId = currentUser!.uid;
        DocumentReference userDocRef = usersRef.doc(userId);
        await userDocRef.update({
          "aboutYou": aboutYou.text,
          "imageUrl": imgUrl,
          "name": name.text,
          "phone": phone.text,
        });
        update();
        Get.offNamed(AppRoutes.home);
      } on FirebaseAuthException catch (e) {
        print("Firebase Error: " + e.code);
      } catch (e) {
        // ignore: avoid_print
        print("Errrrrror $e");
      }
    }
  }
}
