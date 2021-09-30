import 'package:flutter/material.dart';
class TagPage extends StatelessWidget {
  const TagPage({Key? key}) : super(key: key);

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
      body: GridView.count(
        primary: false,
            padding: EdgeInsets.all(17),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: <Widget>[
              Container(
                height: 162,
                  width: 138,
                color:Colors.orange
              ),
              Container(
                  height: 162,
                  width: 138,
                  color:Colors.orange
              ),
              Container(
                  height: 162,
                  width: 138,
                  color:Colors.orange
              ),
              Container(
                  height: 162,
                  width: 138,
                  color:Colors.orange
              ),
            ],
          ),
    );
  }
}
