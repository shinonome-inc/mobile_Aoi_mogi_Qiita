import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aoi_mogi_qiita/constants.dart';
import 'package:aoi_mogi_qiita/feed_page.dart';
import 'tag_page.dart';
import 'package:aoi_mogi_qiita/my_page.dart';
import 'package:aoi_mogi_qiita/settings_page.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {
  int index=0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Offstage(
              offstage: index != 0,
              child: TickerMode(
                enabled: index == 0,
                child:FeedPage(),
              ),
            ),
            Offstage(
              offstage: index != 1,
              child: TickerMode(
                enabled: index == 1,
                child: TagPage(),
              ),
            ),
            Offstage(
              offstage: index != 2,
              child: TickerMode(
                enabled: index == 2,
                child: MyPage(),
              ),
            ),
            Offstage(
              offstage: index != 3,
              child: TickerMode(
                enabled: index == 3,
                child: SettingsPage(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 83,
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (int index) { setState((){ this.index = index; }); },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_rounded,), label: 'フィード',),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer_outlined,),
                label: 'タグ',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline,), label: 'マイページ'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined,), label: '設定'),
            ],
            unselectedItemColor: bottomGray,
            selectedItemColor: bottomGreen,
            backgroundColor: Colors.white,
          ),
        )
    );
  }
}
