import 'package:caching_excellence_riverpod/features/post_feature/data/models/post.dart';
import 'package:caching_excellence_riverpod/features/post_feature/presentation/ui/pages/post_details_page.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PostDetailsPage(
              id: post.id,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(post.title),
        ),
      ),
    );
  }
}
