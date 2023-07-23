import 'package:clean_architecture_flutter/src/modules/post/domain/errors/errors.dart';
import 'package:clean_architecture_flutter/src/modules/post/domain/repositories/post_repositorie.dart';
import 'package:clean_architecture_flutter/src/modules/post/domain/usecases/get_posts_comments.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class PostRepositoryMock extends Mock implements IPostRepository {

}

void main() {
  final repository = PostRepositoryMock();
  final usecase = GetPostsComments(repository);

  test('Should return a list of comments', () async {
    when(() => repository.getPostComments('1')).thenAnswer((invocation) async => right([]));

    final result = await usecase('1');

    expect(result.fold(id, id), isA<List>());
  });

  test('Should return a ArgumentsException', () async {
    final result = await usecase('');

    expect(result.fold(id, id), isA<ArgumentsException>());
  });
}