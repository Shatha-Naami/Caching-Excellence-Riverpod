import 'dart:developer';

import 'package:caching_excellence_riverpod/api_management/dio_service.dart';
import 'package:caching_excellence_riverpod/features/post_feature/data/models/post.dart';
import 'package:caching_excellence_riverpod/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';


/// gets a post list
final postsProvider = FutureProvider.autoDispose<List<Post>>(
  (ref) async {
    /// debounce only when refreshing
    if (ref.state.isRefreshing) {
      await ref.debounce();
    }

    log('get posts', name: 'postsProvider');

    final dio = ref.read(dioService);
    final res = await dio.get('posts');
    final List list = res.data;
    return list.map((e) => Post.fromJson(e)).toList();
  },
  dependencies: [dioService],
);

/// gets a post with given id
final postProvider = FutureProvider.autoDispose.family<Post, int>(
  (ref, id) async {
    /// logs the lifecycle
    ref.logger();

    /// caches for 3 seconds (it's a default duration for this example)
    final link = ref.cacheFor();

    /// creates a cancel token with auto cancel option
    final token = ref.cancelToken();

    try {
      final dio = ref.read(dioService);
      final res = await dio.get('posts/$id', cancelToken: token);
      return Post.fromJson(res.data);
    } on DioException catch (e) {
      /// if the request is canceled, close the link,
      /// and let the provider dispose itself
      if (e.type == DioExceptionType.cancel) {
        link.close();
      }
      rethrow;
    }
  },
  dependencies: [dioService],
);
