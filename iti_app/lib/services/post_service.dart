import 'package:dio/dio.dart';
import 'package:iti_app/models/post_model.dart';

class PostService {
  Future<List<PostModel>> getPosts() async {
    List<PostModel> postList = [];
    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    var data = response.data;
    data.forEach((element) {
      PostModel post = PostModel.fromJson(element);
      postList.add(post);
    });
    return postList;
  }
}
