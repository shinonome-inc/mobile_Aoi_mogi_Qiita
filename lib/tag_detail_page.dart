import 'package:aoi_mogi_qiita/Api/model/tag_detail.dart';
import 'package:aoi_mogi_qiita/Api/network_request.dart';
import 'package:aoi_mogi_qiita/BottomSheet/article_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class TagDetail extends StatefulWidget {
  final String tagId;
  TagDetail({Key? key, required this.tagId}) : super(key: key);

  @override
  _TagDetailState createState() => _TagDetailState();
}

class _TagDetailState extends State<TagDetail> {
  int _page = 1;
  Qiita qiita = Qiita();

  late Future<List<TagArticle>> refreshItems;
  @override
  void initState() {
    refreshItems = Qiita.fetchTagArticle(widget.tagId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: backGreen),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.tagId,
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Pacifico',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(28),
          child: Column(
            children: [
              Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                height: 28,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        '投稿記事',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                color: tagGray,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<TagArticle>>(
            future: Qiita.fetchTagArticle(widget.tagId),
            builder: (BuildContext context,
                AsyncSnapshot<List<TagArticle>> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {}

              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              if (snapshot.hasData) {
                return QiitaCard(
                    qiitaCard: snapshot.data!, tagId: widget.tagId);
              } else {
                return Text("データが存在しません");
              }
            }),
      ),
    );
  }
}

class QiitaCard extends StatefulWidget {
  final String tagId;
  final List<TagArticle> qiitaCard;
  const QiitaCard({Key? key, required this.qiitaCard, required this.tagId})
      : super(key: key);

  @override
  _QiitaCardState createState() => _QiitaCardState();
}

class _QiitaCardState extends State<QiitaCard> {
  ScrollController _controller = ScrollController();
  bool _isLoading = false;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() async {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        fetchMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        print('Loading New Data');
        Qiita.fetchTagArticle(widget.tagId);
      },
      child: ListView.builder(
          controller: _controller,
          itemCount: widget.qiitaCard.length,
          itemBuilder: (BuildContext context, int index) {
            final article = widget.qiitaCard[index];
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
          }),
    );
  }

  void fetchMore() async {
    if (!_isLoading) {
      _isLoading = true;
      _page++;
      var items = await Qiita.fetchTagArticle(widget.tagId);
      print(items);
      setState(() {
        widget.qiitaCard.addAll(items);
      });
      _isLoading = false;
    }
  }
}
