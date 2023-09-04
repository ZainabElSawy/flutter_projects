//!message screen
// import 'package:chat_app/controller/messagescreencontroller.dart';
// import 'package:chat_app/model/chatuser.dart';
// import 'package:chat_app/view/widgets/home/users/cardusers.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MessageScreen extends StatelessWidget {
//   const MessageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<ChatUser> list = [];
//     MessageScreenControllerImp controller =
//         Get.put(MessageScreenControllerImp());
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       child: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("users").snapshots(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//             case ConnectionState.none:
//               return const Center(child: CircularProgressIndicator());
//             case ConnectionState.active:
//             case ConnectionState.done:
//               if (snapshot.hasData) {
//                 final data = snapshot.data?.docs;
//                 list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ??
//                     [];
//                 return ListView.builder(
//                   itemCount: list.length,
//                   itemBuilder: (context, index) => FutureBuilder(
//                       future: controller.checkLastMessage(
//                           FirebaseAuth.instance.currentUser!.email!,
//                           list[index].email!),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const CircularProgressIndicator(
//                             color: Colors.transparent,
//                           );
//                         } else if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else {
//                           return snapshot.data != "No"
//                               ? CardUsers(
//                                   chatUser: list[index],
//                                   lastMessage: (snapshot.data as Map<String,
//                                           dynamic>)["lastMessage"]
//                                       .toString(),
//                                   sendtime: (snapshot.data
//                                           as Map<String, dynamic>)["SendTime"]
//                                       .toString(),
//                                 )
//                               : Container();
//                         }
//                       }),
//                 );
//               }
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }


//!message screen controller
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// abstract class MessageScreenController extends GetxController {
//   checkLastMessage(String currentUserEmail, String receiverEmail);
// }

// class MessageScreenControllerImp extends MessageScreenController {
//   String lastMessage = '';
//   Map<String, String> lastMessageContent = {};
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   @override
//   checkLastMessage(String currentUserEmail, String receiverEmail) async {
//     QuerySnapshot snapshot1 = await firestore
//         .collection('LastMessages')
//         .where("sender", isEqualTo: currentUserEmail)
//         .where("receiver", isEqualTo: receiverEmail)
//         .limit(1)
//         .get();
//     QuerySnapshot snapshot2 = await firestore
//         .collection('LastMessages')
//         .where("sender", isEqualTo: receiverEmail)
//         .where("receiver", isEqualTo: currentUserEmail)
//         .limit(1)
//         .get();

//     if (snapshot1.docs.isNotEmpty || snapshot2.docs.isNotEmpty) {
//       DocumentSnapshot document = snapshot1.docs.isNotEmpty
//           ? snapshot1.docs.first
//           : snapshot2.docs.first;

//       lastMessage =
//           (document.data() as Map<String, dynamic>)['last_message'].toString();
//       lastMessage =
//           snapshot1.docs.isNotEmpty ? ("you: $lastMessage") : lastMessage;
//       lastMessageContent = {
//         "lastMessage": lastMessage,
//         "SendTime":
//             (document.data() as Map<String, dynamic>)['sendTime'].toString(),
//       };

//       update();
//       return lastMessageContent;
//     } else {
//       return "No";
//     }
//   }
// }
