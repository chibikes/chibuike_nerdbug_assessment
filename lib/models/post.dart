class Post {
  final String id;
  final String userId;
  final String title;
  final String body;
  bool isLiked;

  Post({
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
}
