import 'package:chat_app/controller/home/chatscreencontroller.dart';
import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/core/functions/showbottomsheet.dart';
import 'package:chat_app/model/chatuser.dart';
import 'package:chat_app/view/widgets/home/chat/customchatappbar.dart';
import 'package:chat_app/view/widgets/home/chat/sendmessagebox.dart';
import 'package:chat_app/view/widgets/home/chat/viewallmessageinchat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  ChatUser chatUser = Get.arguments;
  @override
  Widget build(BuildContext context) {
    ChatScreenControllerImp controller = Get.put(ChatScreenControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: CustomChatAppBar(chatUser: chatUser),
      body: Column(
        children: [
          Expanded(
              flex: 9,
              child: StreamBuilder(
                stream: controller.chatStream,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        final data = snapshot.data!.docs.reversed;
                        controller.saveListMessages(data);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: ViewAllMessagesInChat(
                            listLength: controller.list.length,
                            messages: controller.list,
                            chatUser: chatUser,
                            isLoadingImg: controller.isLoadingImg,
                          ),
                        );
                      }
                  }
                  return Container();
                },
              )),
          Expanded(
            flex: 1,
            child: SendMessageBox(
              ctrMessage: controller.messageText,
              onPressedSend: () => controller.sendTextMessage(
                controller.currentUser!.email!,
                chatUser.email!,
                controller.messageText.text,
              ),
              onPressedCam: () => ShowBottomSheet(
                context,
                () => controller.uploadImage(
                  controller.currentUser!.email!,
                  chatUser.email!,
                  "camera",
                ),
                () => controller.uploadImage(
                    controller.currentUser!.email!, chatUser.email!, "gallary"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
