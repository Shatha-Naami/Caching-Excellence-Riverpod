import 'package:caching_excellence_riverpod/features/post_feature/presentation/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailsPage extends ConsumerWidget {
  final int id;

  const PostDetailsPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    final asyncUser = ref.watch(postProvider(id));
    return Scaffold(
      appBar: AppBar(title: Text('$id')),
      body: Center(
        child: asyncUser.when(
          data: (post) => Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              post.title,
              textAlign: TextAlign.center,
            ),
          ),
          error: (e, __) => Text('$e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
