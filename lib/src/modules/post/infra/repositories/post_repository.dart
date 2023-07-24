import 'package:clean_architecture_flutter/src/modules/post/domain/entities/comment.dart';
import 'package:clean_architecture_flutter/src/modules/post/domain/entities/post.dart';
import 'package:clean_architecture_flutter/src/modules/post/domain/errors/errors.dart';
import 'package:clean_architecture_flutter/src/modules/post/domain/repositories/post_repositorie.dart';
import 'package:clean_architecture_flutter/src/modules/post/infra/adapters/comment_adapter.dart';
import 'package:clean_architecture_flutter/src/modules/post/infra/datasources/post_datasource.dart';
import 'package:clean_architecture_flutter/src/modules/post/infra/datasources/user_datasource.dart';
import 'package:fpdart/src/either.dart';
import '../adapters/post_adapter.dart';
import '../datasources/comment_datasource.dart';

class PostRepository extends IPostRepository {
  final UserDatasource datasource;
  final PostDatasource postDatasource;
  final CommentDatasource commentDatasource;

  PostRepository(this.datasource, this.postDatasource, this.commentDatasource);

  @override
  Future<Either<IPostException, List<Comment>>> getPostComments(String postId) async {
    try {
      final list = await commentDatasource.getComments();
      final comments = list.where((element) => element['postId'] == postId)
      .map(CommentAdapter.fromJson).toList();
      return right(comments);
    } on IPostException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IPostException, List<Post>>> getPosts() async {
    try {
      final listComments = await commentDatasource.getComments();
      final listPosts = await postDatasource.getPosts();
      final listUsers = await datasource.getUsers();

      for (var user in listUsers){
        for (var post in listPosts){
          if (user['id'] == post['userId']){
            post['user'] = user;
            post['totalComments'] = listComments.where((element) => element['postId'] == post['id']).length;
          }
        }
      }

      final posts = listPosts.map(PostAdapter.fromJson).toList();
      return right(posts);
    } on IPostException catch (e) {
      return left(e);
    }
  }
  
}