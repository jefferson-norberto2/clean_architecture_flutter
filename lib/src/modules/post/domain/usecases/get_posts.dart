import 'package:clean_architecture_flutter/src/modules/post/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/post.dart';
import '../repositories/post_repositorie.dart';

abstract class IGetPosts {
  Future<Either<IPostException, List<Post>>> call();
}

class GetPost implements IGetPosts {
  final IPostRepository _repository;

  GetPost(this._repository);

  @override
  Future< Either<IPostException, List<Post>>> call() async {
    return await _repository.getPosts();
  }
}