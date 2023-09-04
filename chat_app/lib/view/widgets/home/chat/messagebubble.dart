import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String type;
  final String textMessage;
  final String sendTime;
  final String? imgUrl;
  final bool? isLoadingImg;
  const MessageBubble(
      {required this.type,
      required this.textMessage,
      required this.sendTime,
      required this.imgUrl,
      required this.isLoadingImg,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment:
            type == "send" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              color:
                  type == "send" ? AppColor.primaryColor : Colors.grey.shade400,
              borderRadius: type == "send"
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
            ),
            child: isLoadingImg == true
                ? const SizedBox(
                    width: 200,
                    height: 220,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColor.primaryColor,
                    ),
                  )
                : isLoadingImg == false && imgUrl != ""
                    ? Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          width: 200,
                          height: 220,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              imgUrl!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 15),
                        child: Text(
                          textMessage,
                          style: TextStyle(color: AppColor.white, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              sendTime,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
