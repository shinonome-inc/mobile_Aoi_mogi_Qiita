import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/qiita_api.dart';
import 'dart:async';


class Qiita{
  static Future<List<QiitaApi>> fetchQiitaApi() async {
  final response = await http.get(Uri.parse('https://qiita.com/api/v2/items'));
  if (response.statusCode == 200) {
    final List<dynamic> jsonArray = json.decode(response.body);
    return jsonArray.map((json) => QiitaApi.fromJson(json)).toList();
  } else {
    throw Exception('読み込めませんでした');
  }
}}