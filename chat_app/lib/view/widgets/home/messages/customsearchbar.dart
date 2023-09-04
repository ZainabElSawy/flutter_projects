import 'package:chat_app/model/chatuser.dart';
import 'package:chat_app/view/widgets/home/users/cardusers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  void Function()? onTap;
  CustomSearchBar({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          children: [
            Icon(CupertinoIcons.search, color: Colors.grey),
            SizedBox(width: 5),
            Text("Search"),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Result");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ChatUser> list = [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                final data = snapshot.data?.docs;
                list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ??
                    [];
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) => query.isEmpty
                      ? CardUsers(chatUser: list[index])
                      : list[index].name!.startsWith(query)
                          ? CardUsers(chatUser: list[index])
                          : Container(),
                );
              }
          }
          return Container();
        },
      ),
    );
  }
}
