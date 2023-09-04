import 'package:chat_app/controller/home/messagescreencontroller.dart';
import 'package:chat_app/view/widgets/home/messages/customsearchbar.dart';
import 'package:chat_app/view/widgets/home/messages/usersimages.dart';
import 'package:chat_app/view/widgets/home/messages/viewnewmessages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessageScreenControllerImp controller =
        Get.put(MessageScreenControllerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: ListView(
        children: [
          CustomSearchBar(
            onTap: () => showSearch(context: context, delegate: DataSearch()),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 7),
            child: SizedBox(height: 120, child: UsersImages()),
          ),
          StreamBuilder(
            stream: controller.stream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final data = snapshot.data?.docs;
                    controller.saveList(data);
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) => ViewNewMessages(
                        future: controller.checkLastMessage(
                            controller.list[index].sender!,
                            controller.list[index].recever!),
                        lastMessage: controller.list[index],
                      ),
                    );
                  }
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
