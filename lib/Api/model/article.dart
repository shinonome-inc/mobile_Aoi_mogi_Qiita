import 'user.dart';

class Article {
  final String title;
  final String created_at;
  final String url;
  final User user;

  Article(
      {required this.url,
      required this.title,
      required this.created_at,
      required this.user});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      created_at: json['created_at'],
      url: json['url'],
      user: User.fromJson(json['user']),
    );
  }
}
