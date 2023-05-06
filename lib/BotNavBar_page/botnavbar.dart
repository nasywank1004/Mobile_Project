import 'package:flutter/material.dart';
import 'package:reserveeats/BotNavBar_page/menu.dart';
import 'package:reserveeats/BotNavBar_page/search.dart';
import 'package:reserveeats/BotNavBar_page/myaccount.dart';
import 'package:reserveeats/Profile_page/main.dart';
import 'package:reserveeats/Profile_page/pages/detail_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(), DetailUser()];

  void OnTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: OnTappedBar,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_2_rounded),
              label: 'My Account',
            ),
          ]),
    );
  }
}
