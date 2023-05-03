import 'package:flutter/material.dart';
import 'package:reserveeats/Start_page/main.dart';
import 'package:reserveeats/Start_page/welcome.dart';

void main() {
  runApp(MyRestaurantBooking());
}

class MyRestaurantBooking extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Main(),
    );
  }
}