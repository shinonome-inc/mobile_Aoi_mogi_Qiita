import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {

  @override
 Widget build(BuildContext context){
    return Scaffold(
     body: Column(
       children: <Widget>[
         Expanded(child: Container(
           color: Colors.amber,
         ))
       ],
     ),
    );
  }
}
