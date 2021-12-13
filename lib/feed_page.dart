import 'package:aoi_mogi_qiita/Api/model/article.dart';
import 'package:aoi_mogi_qiita/Api/network_request.dart';
import 'package:aoi_mogi_qiita/BottomSheet/article_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                height: 1,
                color: Colors.black,
              ),
            ),
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
                    qiitaCard: snapshot.data!,
                  );
                } else {
                  return Text("データが存在しません");
                }
              }),
        ));
  }
}

class QiitaCard extends StatefulWidget {
  final List<Article> qiitaCard;

  const QiitaCard({Key? key, required this.qiitaCard}) : super(key: key);

  @override
  _QiitaCardState createState() => _QiitaCardState();
}

class _QiitaCardState extends State<QiitaCard> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          print('Loading New Data');
          Qiita.fetchArticle();
        },
        child: ListView.builder(
            itemCount: widget.qiitaCard.length,
            itemBuilder: (BuildContext context, int index) {
              final article = widget.qiitaCard[index];
              DateFormat format = DateFormat('yyyy/MM/dd');
              String timeDate = format.format(
                  DateTime.parse(widget.qiitaCard[index].createdAt).toLocal());
              return Card(
                elevation: 0,
                margin: EdgeInsets.all(0),
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      ShowArticle(article.url, context);
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(article.user.profile_image_url),
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
                                            article.createdAt,
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
                    indent: 75.0,
                    height: 16,
                  ),
                ]),
              );
            }));
  }
}
