import 'dart:io';
import 'dart:math';

import 'package:chat_app/model/chatmessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

abstract class ChatScreenController extends GetxController {
  saveListMessages(Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> data);
  sendTextMessage(String sender, String recever, String textMessage);
  uploadImage(String sender, String recever, String fromWhere);
}

class ChatScreenControllerImp extends ChatScreenController {
  TextEditingController messageText = TextEditingController();
  final FirebaseFirestore collectionRef = FirebaseFirestore.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  List<ChatMessage> list = [];
  String? url = '';
  bool isLoadingImg = false;
  Stream<QuerySnapshot<Map<String, dynamic>>> chatStream = FirebaseFirestore
      .instance
      .collection('Messages')
      .orderBy("time")
      .snapshots();
  @override
  saveListMessages(Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
    list = data.map((e) => ChatMessage.fromJson(e.data())).toList();
  }

  @override
  uploadImage(String sender, String recever, String fromWhere) async {
    File file;
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
      var refStorage = FirebaseStorage.instance.ref("images/$random$imageName");
      await refStorage.putFile(file);
      url = await refStorage.getDownloadURL();
      //print("***URL***$url");
      isLoadingImg = false;
      DateTime currentTime = DateTime.now();
      String formattedTime = DateFormat('hh:mm a').format(currentTime);
      await collectionRef.collection('Messages').add({
        "sender": sender,
        "recever": recever,
        "textMessage": "",
        "sendTime": formattedTime,
        "imgUrl": url,
        "time": currentTime.toString(),
      });
      return url;
    } else {
      isLoadingImg = false;
      return "";
    }
  }

  @override
  sendTextMessage(String sender, String recever, String textMessage) async {
    if (messageText.text != '') {
      //Messages Collection
      messageText.clear();
      update();
      DateTime currentTime = DateTime.now();
      String formattedTime = DateFormat('hh:mm a').format(currentTime);
      await collectionRef.collection('Messages').add({
        "sender": sender,
        "recever": recever,
        "textMessage": textMessage,
        "sendTime": formattedTime,
        "imgUrl": "",
        "time": currentTime.toString(),
      });
      //Last Messages Collection
      String documentId =
          sender.compareTo(recever) < 0 ? sender + recever : recever + sender;
      DocumentSnapshot document =
          await collectionRef.collection('LastMessages').doc(documentId).get();
      Map<String, dynamic> data = {
        'sender': sender,
        'receiver': recever,
        'last_message': textMessage,
        "sendTime": formattedTime,
        "time": currentTime.toString()
      };
      if (document.exists) {
        await collectionRef
            .collection('LastMessages')
            .doc(documentId)
            .update(data);
      } else {
        await collectionRef
            .collection('LastMessages')
            .doc(documentId)
            .set(data);
      }
      update();
    }
  }
}
