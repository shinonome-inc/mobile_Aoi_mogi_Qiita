import 'package:aoi_mogi_qiita/Api/model/taglist.dart';
import 'package:aoi_mogi_qiita/Api/network_request.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Tags',
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
        body: Center(
          child: FutureBuilder<List<Tag>>(
              future: Qiita.fetchTag(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Tag>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                if (snapshot.hasData) {
                  return TagListCard(
                    taglist: snapshot.data!,
                  );
                } else {
                  return Text("データが存在しません");
                }
              }),
        ));
  }
}

class TagListCard extends StatefulWidget {
  final List<Tag> taglist;

  const TagListCard({Key? key, required this.taglist}) : super(key: key);

  @override
  _TagListCardState createState() => _TagListCardState();
}

class _TagListCardState extends State<TagListCard> {
  Qiita qiita = Qiita();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          print('Loading New Data');
          Qiita.fetchTag();
        },
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 162 / 138,
              crossAxisCount: 2,
            ),
            itemCount: widget.taglist.length,
            itemBuilder: (BuildContext context, int index) {
              final taglist = widget.taglist[index];
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: HexColor('#E0E0E0')),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 38,
                          width: 38,
                          child: Image.network(taglist.iconUrl),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          height: 20,
                          child: Text(
                            taglist.id,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Column(children: [
                            Text(
                              '記事件数: ' + taglist.itemsCount.toString(),
                              style: TextStyle(
                                  fontSize: 12, color: HexColor('#828282')),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('フォロワー数: ' + taglist.followersCount.toString(),
                                style: TextStyle(
                                    fontSize: 12, color: HexColor('#828282'))),
                          ]),
                        )
                      ]),
                    )),
              );
            }));
  }
}
