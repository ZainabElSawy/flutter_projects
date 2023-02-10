import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iti_app/views/add_post.dart';
import 'package:like_button/like_button.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> posts =
        FirebaseFirestore.instance.collection('posts').snapshots();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: posts,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(data['post_title']),
                        subtitle: Text(data['post_body']),
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          const LikeButton(
                            likeCount: 665,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.comment)),
                              Text('20')
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                CollectionReference posts = FirebaseFirestore
                                    .instance
                                    .collection('posts');

                                posts
                                    .doc(document.id)
                                    .delete()
                                    .then((value) => print("User Deleted"))
                                    .catchError((error) =>
                                        print("Failed to delete user: $error"));
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddPost()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
