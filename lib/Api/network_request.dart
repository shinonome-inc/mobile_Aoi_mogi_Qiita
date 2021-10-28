import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/article.dart';
import 'model/taglist.dart';

class Qiita {
  static Future<List<Article>> fetchArticle() async {
    final response =
        await http.get(Uri.parse('https://qiita.com/api/v2/items'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonArray = json.decode(response.body);
      return jsonArray.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('読み込めませんでした');
    }
  }

  static Future<List<Tag>> fetchTag() async {
    final response = await http.get(Uri.parse(
        'https://qiita.com/api/v2/tags?page=1&per_page=20&sort=count'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonArray = json.decode(response.body);
      return jsonArray.map((json) => Tag.fromJson(json)).toList();
    } else {
      throw Exception('読み込めませんでした');
    }
  }
}
