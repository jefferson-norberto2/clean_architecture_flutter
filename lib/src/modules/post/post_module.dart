import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'domain/repositories/post_repositorie.dart';
import 'domain/usecases/get_posts.dart';
import 'domain/usecases/get_posts_comments.dart';
import 'external/datasources/comment_datasource.dart';
import 'external/datasources/post_datasource.dart';
import 'external/datasources/user_datasource.dart';
import 'infra/datasources/comment_datasource.dart';
import 'infra/datasources/post_datasource.dart';
import 'infra/datasources/user_datasource.dart';
import 'infra/repositories/post_repository.dart';

class PostModule extends Module{
  @override
  final List<Bind> binds = [
    //utils
    Bind.factory((i) => Uno()),

    //datasource
    Bind.factory<IUserDatasource>((i) => UserDatasource(i())),
    Bind.factory<IPostDatasource>((i) => PostDatasource(i())),
    Bind.factory<ICommentDatasource>((i) => CommentDatasource(i())),

    //repository
    Bind.factory<IPostRepository>((i) => PostRepository(i(), i(), i())),

    //usecase
    Bind.factory((i) => GetPost(i())),
    Bind.factory((i) => GetPostsComments(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute('/', child: (_, args) => PostPage()),
  ];
}