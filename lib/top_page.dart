import 'package:flutter/material.dart';
import 'package:aoi_mogi_qiita/constants.dart';
class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

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
            Expanded(flex: 220, child: Container()),
            Text(
              'Qiita feed App',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Pacifico',
                color: Colors.white,
              ),
            ),
            Expanded(flex: 8, child: Container()),
            Text(
              'prey ground',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          Expanded(flex: 321, child: Container()),
            SizedBox(
              height: 52,
              width: MediaQuery.of(context).size.width *0.872,
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
            Expanded(flex: 34, child: Container()),
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
            Expanded(flex: 81, child: Container()),
          ]),
        ]),
      ),
    );
  }
}