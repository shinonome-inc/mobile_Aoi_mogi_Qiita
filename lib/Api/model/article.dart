import 'user.dart';

class Article {
  final String title;
  final String createdAt;
  final String url;
  final User user;

  Article({
    required this.url,
    required this.title,
    required this.createdAt,
    required this.user,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      createdAt: json['created_at'],
      url: json['url'],
      user: User.fromJson(
        json['user'],
      ),
    );
  }
}
