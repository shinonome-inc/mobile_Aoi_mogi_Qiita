import 'package:flutter/material.dart';
import 'package:aoi_mogi_qiita/main.dart';
class Top extends StatefulWidget {
  Top();

  @override
  _TopState createState() => _TopState();
}
class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/img.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.2),
              )),
          Column(children: <Widget>[
            Expanded(flex:22,child:Container()),
            Text(
              'Qiita feed App',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Pacifico',
                color: Colors.white,
              ),
            ),
            Text(
              'prey ground',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          Expanded(flex:33,child:Container()),
            SizedBox(
              height: 52,
              width: 344,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'ログイン',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: buttonGreen,
                  onPrimary: Colors.white,
                  shape: const StadiumBorder(),
                ),
              ),
            ),
            Expanded(flex:3,child:Container()),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Bottom');
                },
              child: Text(
                'ログインせずに利用する',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(flex:8,child:Container()),
          ]),
        ]),
      ),
    );
  }
}