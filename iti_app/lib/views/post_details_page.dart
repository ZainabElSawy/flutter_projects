import 'package:flutter/material.dart';
import 'package:iti_app/models/post_model.dart';

class PostDetails extends StatefulWidget {
  PostModel post;
  PostDetails({super.key, required this.post});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          ListTile(
            title: const Text("Title:"),
            subtitle: Text(widget.post.title),
          ),
          ListTile(
            title: const Text("Body:"),
            subtitle: Text(widget.post.body),
          ),
          ListTile(
            title: const Text("Id:"),
            subtitle: Text("${widget.post.id}"),
          ),
          ListTile(
            title: const Text("UserId:"),
            subtitle: Text("${widget.post.userId}"),
          ),
        ],
      ),
    );
  }
}
