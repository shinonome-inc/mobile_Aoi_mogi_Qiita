import 'user.dart';

class TagArticle {
  final String title;
  final String createdAt;
  final String url;
  final User user;

  TagArticle({
    required this.url,
    required this.title,
    required this.createdAt,
    required this.user,
  });

  factory TagArticle.fromJson(Map<String, dynamic> json) {
    return TagArticle(
      title: json['title'],
      createdAt: json['created_at'],
      url: json['url'],
      user: User.fromJson(
        json['user'],
      ),
    );
  }
}
