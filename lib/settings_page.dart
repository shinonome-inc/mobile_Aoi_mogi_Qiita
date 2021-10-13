import 'package:aoi_mogi_qiita/BottomSheet/privacypolicy_page.dart';
import 'package:aoi_mogi_qiita/BottomSheet/term of service_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BottomSheet/showModelPage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Settings',
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
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 31.5,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            width: double.infinity,
            child: Text(
              'アプリ情報',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              showModalPage(context, PrivacyPolicy());
            },
            child: Card(
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                  leading: Text(
                    'プライバシーポリシー',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          Divider(
            height: 0,
            indent: 16,
          ),
          InkWell(
            onTap: () {
              showModalPage(context, TermofService());
            },
            child: Card(
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                  leading: Text(
                    '利用規約',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          Divider(
            height: 0,
            indent: 16,
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.symmetric(vertical: 0),
            child: ListTile(
              leading: Text(
                'アプリバージョン',
                style: TextStyle(fontSize: 14),
              ),
              trailing: Text('v1.0.0', style: TextStyle(fontSize: 14)),
            ),
          ),
          Divider(
            height: 0,
            indent: 16,
          ),
          SizedBox(
            height: 36,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            width: double.infinity,
            child: Text(
              'その他',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                leading: Text(
                  'ログアウトする',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            indent: 16,
          ),
        ],
      )),
    );
  }
}
