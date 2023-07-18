import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(createToJson: false)
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
