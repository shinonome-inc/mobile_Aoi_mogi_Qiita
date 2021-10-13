import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

void ShowArticle(String url, context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.94,
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 24, bottom: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: HexColor('#F5F5F5'),
          ),
          height: 59,
          width: MediaQuery.of(context).size.width,
          child: Text(
            'article',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 17,
            ),
          ),
        ),
        Divider(
          height: 1,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  child: WebView(
                    initialUrl: url,
                  ))
            ]),
          ),
        )
      ]),
    ),
  );
}
