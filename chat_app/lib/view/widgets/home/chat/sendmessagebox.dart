import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SendMessageBox extends StatelessWidget {
  TextEditingController ctrMessage = TextEditingController();
  void Function()? onPressedSend;
  void Function()? onPressedCam;
  SendMessageBox({
    required this.ctrMessage,
    required this.onPressedSend,
    required this.onPressedCam,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.primaryColor.withOpacity(0.1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: ctrMessage,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  hintText: "Write message here ...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onPressedCam,
            icon: const Icon(
              CupertinoIcons.camera,
              color: AppColor.primaryColor,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: onPressedSend,
            icon: const Icon(
              Icons.send,
              color: AppColor.primaryColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
