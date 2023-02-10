import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String title = '';
  String body = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Post title'),
              onChanged: (value) => title = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Post body',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
              ),
              onChanged: (value) => body = value,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                isLoading = true;
                setState(() {});
                CollectionReference posts =
                    FirebaseFirestore.instance.collection('posts');
                posts
                    .add({
                      'post_title': title,
                      'post_body': body,
                    })
                    .then((value) => print("Post Added"))
                    .catchError((error) => print("Failed to add Post: $error"));
                isLoading = false;
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text('Add post')),
        ],
      ),
    );
  }
}
