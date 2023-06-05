import 'package:flutter/material.dart';
import 'package:reserveeats/BotNavBar_page/menu_table.dart';
import 'package:reserveeats/BotNavBar_page/reservation_table.dart';
import 'package:reserveeats/Drawer_page/rateus.dart';
import 'package:reserveeats/Profile_page/pages/detail_user.dart';
import 'package:reserveeats/Start_page/loginsignin.dart';
import 'package:reserveeats/Cart_page/main_cart.dart';
import 'package:reserveeats/Cart_page/cartmodel.dart';
import 'package:reserveeats/Drawer_page/promo.dart';
import 'package:reserveeats/BotNavBar_page/booking_page.dart';
import 'package:reserveeats/Profile_page/main.dart';
import 'package:reserveeats/BotNavBar_page/menu_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BotNavBar_page/myaccount.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String? username;
  String? email;
  String? foto;
  String? role;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      username = prefs.getString('username');
      foto = prefs.getString('foto');
      role = prefs.getString("role");
    });
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 210,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage("${foto}"),
                )),
          ),
          Text(
            "${username} - ${role}",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "${email}",
            style: TextStyle(color: Colors.grey[200], fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class MyDrawerList extends StatefulWidget {
  @override
  _MyDrawerListState createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  String? role;

  void _fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getString("role");
    });

    print(prefs.getString("role"));
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(6),
          height: 45,
          child: TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailUser()));
              },
              icon: Icon(
                Icons.people_alt_outlined,
                color: Colors.black,
              ),
              label: Text(
                "Account",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.all(6),
          height: 45,
          child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart(
                              model: CartModel(),
                            )));
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              label: Text(
                "Cart",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.all(6),
          height: 45,
          child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservationTable()));
              },
              icon: Icon(
                Icons.book_outlined,
                color: Colors.black,
              ),
              label: Text(
                "Reservation",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.all(6),
          height: 45,
          child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Promo()));
              },
              icon: Icon(
                Icons.discount_outlined,
                color: Colors.black,
              ),
              label: Text(
                "Promo",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.all(6),
          height: 45,
          child: TextButton.icon(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginSignupScreen()));
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              label: Text(
                "Log Out",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.all(6),
          height: 45,
          child: TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RateApp()));
              },
              icon: Icon(
                Icons.star_border_outlined,
                color: Colors.black,
              ),
              label: Text(
                "Rate Us",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
        ),
        Divider(),
        Opacity(
          opacity: role == "admin" ? 1.0 : 0.0,
          child: Container(
            margin: EdgeInsets.all(6),
            height: 45,
            child: TextButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuTable()));
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                label: Text(
                  "List Menu",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
        )
      ],
    );
  }
}
