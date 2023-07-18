import 'dart:developer';

import 'package:caching_excellence_riverpod/features/post_feature/presentation/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RefreshButton extends ConsumerWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      child: const Icon(Icons.refresh),
      onPressed: () {
        log('clicked on refresh button');
        ref.invalidate(postsProvider);
      },
    );
  }
}
