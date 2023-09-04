import 'package:chat_app/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    HomeControllerImp controller = Get.find();
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
        ),
      ),
      actions: [
        GetBuilder<HomeControllerImp>(
          builder: (ctr) => PopupMenuButton<SampleItem>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey[800],
            ),
            onSelected: (SampleItem item) {
              ctr.selectedMenu = item;
              if (item == SampleItem.itemOne) {
                ctr.editProfile();
              } else if (item == SampleItem.itemTwo) {
                ctr.logOut();
                // ignore: curly_braces_in_flow_control_structures
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.grey[800],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Settings"),
                    )
                  ],
                ),
              ),
              PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app_rounded,
                      color: Colors.grey[800],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Log out"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
