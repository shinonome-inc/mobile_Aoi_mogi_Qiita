import 'package:flutter/material.dart';

void TermofService(context) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => DraggableScrollableSheet(
            initialChildSize: 1.0,
            builder: (context, scrollController) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      color: Colors.grey[200],
                    ),
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      '利用規約',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.height * 0.9,
                      child: Text(
                        'Qiita Feed App プライバシーポリシー\n'
                        'Shinonome, inc.（以下「当社」といいます。）は、当社が運営するサービス（以下「本サービス」といいます。）を提供するにあたり、個人情報保護に関する法規範を遵守し、以下のプライバシーポリシー（以下「本ポリシー」といいます。）に従って個人情報の適切な取得、利用、提供等を行います。\n'
                        '1. 個人情報について\n'
                        '本ポリシーにおいて個人情報とは、個人情報の保護に関する法律（以下「個人情報保護法」といいます。）に定める「個人情報」をいいます。\n'
                        '当社は、本サービスに関して、以下の情報をはじめとしたユーザーの情報を取得する場合があり、これらの情報には個人情報が含まれることがあります。\n'
                        'ユーザーが本サービスに登録する情報（氏名、ニックネーム、電話番号、メールアドレスおよびパスワード等）\n'
                        'ユーザーのプロフィールに関する情報（アイコン写真、オフィスへのチェックイン日時等、その他の個人に関する属性情報等）通信端末に関する情報（ユーザーのＩＰアドレス、利用状況、履歴、位置情報、利用端末、これまでにご利用いただいたサービスやご購入いただいた商品、ご覧になったページ・広告、ご利用時間帯、ご利用の方法、ご利用環境等）2. 取得した個人情報の利用目的について'
                        '当社は、取得した個人情報を、以下の目的のために利用いたします。 なお、個人情報の取得にあたって本ポリシーとは別に利用目的を通知した場合は、当社は、以下の目的に加え、個別に通知した目的のためにも当該個人情報を利用いたします。'
                        '本サービスをご利用するユーザー同士が本サービス上でお互いを認識できるようにするため本サービスの改善・内容を充実させるため。'
                        '新しいサービスの企画、検討、開発および提供をするため。'
                        'ユーザーからのお問い合わせに対応するため。'
                        'ユーザーの本人確認を行うため。'
                        'その他、上記の利用目的および当社の事業に付帯、関連する目的のため。'
                        '3．個人情報の第三者への提供について'
                        '本サービスは、以下に定める場合、個人情報を第三者に提供します。本サービスにおけるユーザーの識別のため、他のユーザー向けに本サービス上でユーザーの個人情報を表示する場合'
                        'ユーザーの指示または同意に基づいて第三者に個人情報を提供する場合。'
                        '裁判所、監督官庁その他の公的機関から取得情報を提供するよう求められた場合等の個人情報保護法で第三者への個人情報の提供が認められている場合。'
                        '4. 第三者が提供するサービスについて'
                        '当社は、第三者が提供するサービスを用いて本サービスの品質向上または表示するコンテンツを最適化するために、 クッキーおよびアクセスログ等の情報を第三者に提供する場合があります。'
                        'アプリで使用されているサードパーイティのサービスプロバイダは下記になります。'
                        '・Firebase Analytics'
                        '6．個人情報の管理について'
                        '本法人は個人データを正確かつ最新の状態に保ち、紛失・改ざん・漏えいの防止等、安全管理のために必要かつ適切な措置を講じます。'
                        '5．業務委託の際の扱い'
                        '利用目的の達成のため、個人情報の取り扱いを外部に委託することがあります。その際は業務委託先に対して、漏えい、再提供のないよう個人情報の取扱いに関する契約を結ぶ等、適切な管理を行います'
                        '6. 情報の開示・訂正・削除について'
                        '当社は、必要に応じて、本ポリシーを変更することがあります。 なお、法令上ユーザーの同意が必要となるような変更を実施する場合、当社所定の方法によりユーザーからの同意を取得いたします。'
                        '7. 個人情報に関するお問い合わせ等について'
                        'このプライバシーポリシーに関するお問い合わせは、下記までお願いいたします。'
                        'Shinonome, inc. アプリ開発チーム'
                        'MAIL: Matarai@shinonome.io',
                        style: TextStyle(fontSize: 14),
                      )),
                ],
              ),
            ),
          ));
}
