import 'package:chat_app/model/chatuser.dart';
import 'package:chat_app/model/lastmessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class MessageScreenController extends GetxController {
  saveList(List<QueryDocumentSnapshot<Map<String, dynamic>>>? data);
  checkLastMessage(String sender, String receiver);
}

class MessageScreenControllerImp extends MessageScreenController {
  User currentUser = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  ChatUser chatUser = ChatUser();
  Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore
      .instance
      .collection("LastMessages")
      .orderBy("time", descending: true)
      .snapshots();
  List<LastMessage> list = [];
  @override
  saveList(List<QueryDocumentSnapshot<Map<String, dynamic>>>? data){
    list = data?.map((e) => LastMessage.fromJson(e.data())).toList() ?? [];
  }

  @override
  checkLastMessage(String sender, String receiver) async {
    if (sender != currentUser.email && receiver == currentUser.email) {
      QuerySnapshot snapshot1 = await firestore
          .collection('users')
          .where("email", isEqualTo: sender)
          .limit(1)
          .get();

      if (snapshot1.docs.isNotEmpty) {
        DocumentSnapshot document = snapshot1.docs.first;
        update();
        chatUser = ChatUser.fromJson(document.data() as Map<String, dynamic>);

        return chatUser;
      }
      return "No";
    } else if (sender == currentUser.email && receiver != currentUser.email) {
      QuerySnapshot snapshot2 = await firestore
          .collection('users')
          .where("email", isEqualTo: receiver)
          .limit(1)
          .get();
      if (snapshot2.docs.isNotEmpty) {
        DocumentSnapshot document = snapshot2.docs.first;
        update();
        chatUser = ChatUser.fromJson(document.data() as Map<String, dynamic>);
        return chatUser;
      }
      return "No";
    } else {
      return "No";
    }
  }
}
