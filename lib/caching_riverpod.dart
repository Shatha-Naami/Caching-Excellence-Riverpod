import 'package:caching_excellence_riverpod/features/post_feature/presentation/ui/pages/post_list_page.dart';
import 'package:caching_excellence_riverpod/features/post_feature/presentation/ui/widgets/refresh_button.dart';
import 'package:flutter/material.dart';

class CachingRiverpod extends StatelessWidget {
  const CachingRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Caching Excellence: Riverpod+'),
      ),
      body: const PostListPage(),
      floatingActionButton: const RefreshButton(),
    );
  }
}
