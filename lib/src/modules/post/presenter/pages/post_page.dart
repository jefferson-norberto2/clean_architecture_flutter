import 'package:clean_architecture_flutter/src/modules/post/presenter/states/post_state.dart';
import 'package:clean_architecture_flutter/src/modules/post/presenter/stores/post_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostStore>().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PostStore>();
    final state = store.value;

    Widget child = Container();

    if (state is LoadingPostState){
      child = const Center(child: CircularProgressIndicator());
    }

    if (state is ErrorPostState){
      child = Center(child: Text(state.message));
    }

    if (state is SuccessPostState){
      child = ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          final post = state.posts[index];
          return ListTile(
            title: Text(post.id),
            subtitle: Text(post.text),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: child,
    );

  }
}