import 'package:chat_app/controller/home/usersscreencontroller.dart';
import 'package:chat_app/view/widgets/home/users/viewallusers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersScreenControllerImp controller = Get.put(UsersScreenControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: StreamBuilder(
          stream: controller.usersStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final data = snapshot.data?.docs;
                  controller.saveListAndMakeMeAtFirst(data);
                  return ViewAllUsers(
                    listLength: controller.list.length,
                    users: controller.list,
                  );
                }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
