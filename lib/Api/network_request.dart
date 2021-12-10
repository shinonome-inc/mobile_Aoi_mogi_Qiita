import 'dart:async';
import 'dart:convert';

import 'package:aoi_mogi_qiita/Api/model/tag_detail.dart';
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

  static Future<List<TagArticle>> fetchTagArticle(String tagId) async {
    final response = await http.get(Uri.parse('https://qiita.com/api/v2/tags/' +
        tagId +
        '/items?page=1&per_page=20'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonArray = json.decode(response.body);
      return jsonArray.map((json) => TagArticle.fromJson(json)).toList();
    } else {
      throw Exception('読み込めませんでした');
    }
  }
}
