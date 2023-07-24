import 'package:clean_architecture_flutter/src/modules/post/domain/entities/post.dart';
import 'package:clean_architecture_flutter/src/modules/post/infra/adapters/user_adapter.dart';

class PostAdapter {
  static Post fromJson(dynamic data){
    return Post(
      id: data['id'],
      text: data['text'],
      totalComments: data['totalComments'],
      user: UserAdapter.fromJson(data['user']),
    );
  }
}