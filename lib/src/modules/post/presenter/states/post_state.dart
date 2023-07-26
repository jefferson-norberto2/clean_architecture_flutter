import '../../domain/entities/post.dart';

abstract class PostState{}

class SuccessPostState implements PostState{
  final List<Post> posts;

  SuccessPostState(this.posts);
}

class EmptyPostState extends SuccessPostState{
  EmptyPostState() : super([]);
}

class LoadingPostState implements PostState{}

class ErrorPostState implements PostState{
  final String message;

  ErrorPostState(this.message);
}