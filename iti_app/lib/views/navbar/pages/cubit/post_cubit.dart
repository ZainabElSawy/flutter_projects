// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../models/post_model.dart';
import '../../../../services/post_service.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial()) {
    getPosts();
  }
  List<PostModel> posts = [];
  getPosts() async {
    try {
      emit(PostLoading());
      posts = await PostService().getPosts();
      emit(PostSuccess(posts));
    } catch (e) {
      emit(PostError("Faild to get data"));
    }
  }
}
