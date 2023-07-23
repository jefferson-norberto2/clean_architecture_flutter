import 'user.dart';

class Post{
  final String id;
  final User user;
  final String text;
  final int totalComments;

  Post(this.id, this.user, this.text, this.totalComments);
}