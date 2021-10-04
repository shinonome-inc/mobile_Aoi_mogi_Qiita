import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void ShowArticle(String url, context) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => DraggableScrollableSheet(
            initialChildSize: 1.0,
            builder: (context, scrollController) => Container(
              child: Column(
                children: [
                  Text(
                    'Article',
                    style: TextStyle(fontSize: 17, fontFamily: 'Pacifico'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0))),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.height * 0.9,
                        child: WebView(
                          initialUrl: url,
                        )),
                  ),
                ],
              ),
            ),
          ));
}
