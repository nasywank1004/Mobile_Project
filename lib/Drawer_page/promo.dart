import 'package:flutter/material.dart';
import 'package:reserveeats/Drawer_page/drawer.dart';
import 'package:reserveeats/Drawer_page/tile.dart';
import 'package:reserveeats/BotNavBar_page/botnavbar.dart';

class Promo extends StatefulWidget {
  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyBottomNavigationBar()));
            ;
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text('PROMO'),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [MyHeaderDrawer(), MyDrawerList()],
          ),
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(children: <Widget>[
          ActivityListTile(
              title: 'Food Promo',
              subtitle: 'Promo untuk seluruh menu makanan*',
              trailingImage: Image.asset("images/food.png", height: 100),
              color: Color.fromARGB(255, 250, 255, 108),
              gradient: Color.fromARGB(255, 255, 206, 58),
              onTab: () {}),
          ActivityListTile(
              title: 'Weekend Promo',
              subtitle: 'Promo akhir pekan, perut kenyang, dompet aman!',
              trailingImage: Image.asset("images/weekend.png", height: 100),
              color: Color.fromARGB(255, 250, 255, 108),
              gradient: Color.fromARGB(255, 255, 206, 58),
              onTab: () {}),
          ActivityListTile(
              title: 'Reservation Promo',
              subtitle: 'Promo untuk makan bersama orang tercinta',
              trailingImage: Image.asset("images/family.png", height: 90),
              color: Color.fromARGB(255, 250, 255, 108),
              gradient: Color.fromARGB(255, 255, 206, 58),
              onTab: () {})
        ]),
      ),
    );
  }
}
