import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String body;
  final bool isLiked;

  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.isLiked = false,
  });

  Post copyWith({
    String? id,
    String? userId,
    String? title,
    String? body,
    bool? isLiked,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'].toString(),
    userId: json['userId'].toString(),
    title: json['title'] ?? '',
    body: json['body'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'body': body,
  };

  @override
  List<Object?> get props => [id, userId, title, body, isLiked];
}
