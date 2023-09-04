import 'package:chat_app/model/chatuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class UsersScreenController extends GetxController {
  saveListAndMakeMeAtFirst(
      List<QueryDocumentSnapshot<Map<String, dynamic>>>? data);
}

class UsersScreenControllerImp extends UsersScreenController {
  List<ChatUser> list = [];
  Stream<QuerySnapshot<Map<String, dynamic>>> usersStream = FirebaseFirestore
      .instance
      .collection("users")
      .orderBy("name")
      .snapshots();
  @override
  saveListAndMakeMeAtFirst(
      List<QueryDocumentSnapshot<Map<String, dynamic>>>? data) {
    list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];
    for (var element in list) {
      if (element.email == FirebaseAuth.instance.currentUser!.email) {
        int index = list.indexOf(element);
        ChatUser user = list[0];
        list[0] = list[index];
        list[index] = user;
      }
    }
  }
}
