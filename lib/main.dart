import 'package:aoi_mogi_qiita/bottomnavigation.dart';
import 'package:aoi_mogi_qiita/top_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Top(),
      routes: {
        '/Bottom': (context) => BottomNavigation(),
        '/Top': (context) => Top(),
      },
    ),
  );
}
