import 'package:fpdart/fpdart.dart';

import '../entities/comment.dart';
import '../errors/errors.dart';
import '../repositories/post_repositorie.dart';

abstract class IGetPostsComments {
  Future<Either<IPostException, List<Comment>>> call(String postId);
}

class GetPostsComments implements IGetPostsComments {
  final IPostRepository repository;

  GetPostsComments(this.repository);

  @override
  Future<Either<IPostException, List<Comment>>> call(String postId) async {

    if (postId.isEmpty) {
      return const Left(ArgumentsException('PostId is empty'));
    }

    return await repository.getPostComments(postId);
  }
}