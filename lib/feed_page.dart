
import 'package:flutter/material.dart';
import 'package:aoi_mogi_qiita/Api/network_request.dart';
import 'package:aoi_mogi_qiita/Api/model/qiita_api.dart';
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
    child: FutureBuilder<List<QiitaApi>>(
    future: Qiita.fetchQiitaApi(),
        builder: (BuildContext context, AsyncSnapshot<List<QiitaApi>> snapshot){
        if (snapshot.connectionState != ConnectionState.done) {
        return CircularProgressIndicator();
        }

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                if (snapshot.hasData) {
                  return QiitaCard(qiitacard: snapshot.data!,);

                } else {
                  return Text("データが存在しません");
                }
              }),
        ));
  }
}
class QiitaCard extends StatefulWidget {
  final List<QiitaApi> qiitacard;
  const QiitaCard({Key? key , required this.qiitacard}) : super(key: key);

  @override
  _QiitaCardState createState() => _QiitaCardState();
}

class _QiitaCardState extends State<QiitaCard> {
  Qiita qiita = Qiita();

  Widget _model (QiitaApi qiitaapi){
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
            child: Align(alignment: Alignment.center,
              child: Text("Article",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Pacifico'
                  )
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: WebView(initialUrl: qiitaapi.url,)
              ),
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
              Qiita.fetchQiitaApi();
            },
            child: ListView.builder(
                itemCount: widget.qiitacard.length,
                itemBuilder: (BuildContext context, int index) {
                  final qiitaapi = widget.qiitacard[index];
                  DateTime dateTime = DateTime.parse(qiitaapi.created_at);
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0),
                    child: Column(children: [
                      InkWell(
    onTap: () {
                          showModalBottomSheet<void>(
                          context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                            ),
                          builder: (BuildContext context) {
                  return new Container(
                  height: 500,
                  child: Column(
                    children:[
                      Container(
                        child:Text('Article',style: TextStyle(fontSize: 17,fontFamily: 'Pacifico'),),
                      ),
                       Container(
                    decoration:  BoxDecoration(color: Colors.amber, borderRadius: new BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0))),
                    child: Container(
                    child: WebView(
                    initialUrl: qiitaapi.url,
                    )),
                    ),
                            ],
                  ),
                  );
                  },);
                            },
                        child: ListTile(
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    qiitaapi.user.profile_image_url),
                                radius: 24.0,
                              ),
                              SizedBox(width: 20.0),
                              Flexible(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:<Widget> [
                                      Text(qiitaapi.title,
                                        style: TextStyle(fontSize: 14.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('@',
                                            style: TextStyle(fontSize: 12.0,
                                              color: Colors.grey,),
                                            overflow: TextOverflow.ellipsis,),
                                          Text(
                                            qiitaapi.user.id,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text('投稿日:',
                                            style: TextStyle(fontSize: 12.0,
                                              color: Colors.grey,),
                                            overflow: TextOverflow.ellipsis,),
                                          Text(
                                            qiitaapi.created_at,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 16,),
                    ]),
                  );
                })));
  }
}
