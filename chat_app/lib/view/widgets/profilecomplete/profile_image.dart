import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileImage extends StatelessWidget {
  String? imgUrl;
  bool isLoading;
  ProfileImage({required this.imgUrl, required this.isLoading, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundImage: imgUrl == null
          ? const AssetImage("images/usericon.jpg")
          : NetworkImage(imgUrl!) as ImageProvider<Object>,
      child: isLoading ? const CircularProgressIndicator() : Container(),
    );
  }
}
