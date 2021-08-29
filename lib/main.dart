import 'package:flutter/material.dart';
import 'package:aoi_mogi_qiita/top_page.dart';
import 'package:aoi_mogi_qiita/bottomnavigation.dart';
void main() {
  runApp(
    MaterialApp(
      home: Top(),
      routes: {
        '/Bottom':(context)=>BottomNavigation(),
      },
    ),
  );
}
Color bottomGray=Color(0xFF828282);
Color buttonGreen=Color(0xFF468300);
Color bottomGreen=Color(0xFF74C13A);
