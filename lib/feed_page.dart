import 'package:aoi_mogi_qiita/Api/model/article.dart';
import 'package:aoi_mogi_qiita/Api/network_request.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  Qiita qiita = Qiita();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(88),
          child: AppBar(
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: Text(
              'Feed',
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Pacifico',
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Article>>(
              future: Qiita.fetchArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                if (snapshot.hasData) {
                  return QiitaCard(
                    qiitacard: snapshot.data!,
                  );
                } else {
                  return Text("データが存在しません");
                }
              }),
        ));
  }
}

class QiitaCard extends StatefulWidget {
  final List<Article> qiitacard;

  const QiitaCard({Key? key, required this.qiitacard}) : super(key: key);

  @override
  _QiitaCardState createState() => _QiitaCardState();
}

class _QiitaCardState extends State<QiitaCard> {
  Qiita qiita = Qiita();

  Widget _model(Article article) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topRight: const Radius.circular(20),
                topLeft: const Radius.circular(20),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Article",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Pacifico')),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: WebView(
                    initialUrl: article.url,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RefreshIndicator(
            onRefresh: () async {
              print('Loading New Data');
              Qiita.fetchArticle();
            },
            child: ListView.builder(
                itemCount: widget.qiitacard.length,
                itemBuilder: (BuildContext context, int index) {
                  final article = widget.qiitacard[index];
                  DateTime dateTime = DateTime.parse(article.created_at);
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0),
                    child: Column(children: [
                      InkWell(
                        onTap: () {
                          showArticlePage(article.url);
                        },
                        child: ListTile(
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    article.user.profile_image_url),
                                radius: 19.0,
                              ),
                              SizedBox(width: 20.0),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      article.title,
                                      style: TextStyle(fontSize: 14.0),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 10.0),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '@' +
                                                article.user.id +
                                                ' 投稿日: ' +
                                                article.created_at,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 16,
                      ),
                    ]),
                  );
                })));
  }

  void showArticlePage(String url) {
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
}