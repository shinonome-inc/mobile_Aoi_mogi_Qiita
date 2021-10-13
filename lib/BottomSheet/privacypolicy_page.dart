import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'プライバシーポリシー',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'プライバシーポリシー\n'
                      '\n'
                      '\n'
                      ' 情報の収集と使用\n'
                      '\n'
                      '\n'
                      ' 第三者に個人を特定できる情報を提供することはありません。 \n'
                      '\n'
                      '\n'
                      'より良い体験のために、私たちのサービスを使用している間、特定の個人情報を提供するようにあなたに要求する場合があります。\n'
                      ' アプリは、あなたを識別するために使用される情報を収集する可能性のあるサード'
                      'パーティのサービスを使用します。\n'
                      '\n'
                      '\n'
                      ' アプリで使用されるサードパーティのサービスプロバイダー \n'
                      '\n'
                      '\n'
                      '- ログデータ \n'
                      '\n'
                      '\n'
                      'サービスを使用するたびに、アプリでエラーが発生した場合、'
                      'ログデータと呼ばれる電話でデータと情報を（サードパーティ製品を通じて）収集'
                      'することをお知らせします。このログデータには、デバイスのインターネットプロトコ'
                      'ル（「IP」）アドレス、デバイス名、オペレーティングシステムのバージョン、サービ'
                      'スを利用する際のアプリの構成、サービスの使用日時、その他の統計などの情報が含'
                      'まれる場合があります。 \n'
                      '\n'
                      '\n'
                      'Qiita Feed Appではアプリの利便性向上を目的にして、個人を特'
                      '定できないよう匿名化したデータを用いてアクセス解析を行なっています。 例えばア'
                      'プリのクラッシュ情報を匿名で送信し、バグの修正のために利用しています。 また'
                      'ご利用端末のOSやアプリバージョンの使用率などを解析しアプリの改善に'
                      '役立てています。 このプライバシーポリシーの変更,プライバシーポリシーを随時更新する場合があります。したがって、変更がある場合はこのページを定期的に確認することをお勧めします。このページに新しいプライバシーポリシーを掲載して、変更をお知らせします。これらの変更は、このページに投稿された直後に有効になります。 '
                      'お問い合わせ プライバシーポリシーについてご質問やご提案がありましたら'
                      '、mcz9mmdev@gmail.comまでお気軽にお問い合わせください。',
                      style: TextStyle(fontSize: 14),
                    )),
              ],
            ),
          ))
        ]));
  }
}
