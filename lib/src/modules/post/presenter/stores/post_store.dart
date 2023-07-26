import 'package:clean_architecture_flutter/src/modules/post/domain/usecases/get_posts.dart';
import 'package:clean_architecture_flutter/src/modules/post/presenter/states/post_state.dart';
import 'package:flutter/foundation.dart';

class PostStore extends ValueNotifier<PostState> {
  final IGetPosts _getPosts;

  PostStore(this._getPosts) : super(EmptyPostState());

  void emit(PostState newState) => value = newState;

  Future<void> fetchPosts() async {
    emit(LoadingPostState());
    final result = await _getPosts.call();

    final newState = result.fold(
      (l) => ErrorPostState(l.message),
      (r) => SuccessPostState(r),
    );

    emit(newState);
  }
}