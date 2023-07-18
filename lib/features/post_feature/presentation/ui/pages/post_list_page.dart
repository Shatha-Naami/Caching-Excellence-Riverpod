import 'package:caching_excellence_riverpod/features/post_feature/presentation/providers/post_provider.dart';
import 'package:caching_excellence_riverpod/features/post_feature/presentation/ui/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPosts = ref.watch(postsProvider);
    return asyncPosts.when(
      data: (posts) {
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, i) {
            return PostItem(
              post: posts[i],
            );
          },
        );
      },
      error: (_, __) => const Center(child: Text('error!')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
