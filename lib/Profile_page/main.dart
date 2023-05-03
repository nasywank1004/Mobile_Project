import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/Users.dart';
import 'pages/detail_user_page.dart';
import 'pages/add_user_page.dart';
import './pages/home_page.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Users(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          AddUser.routeName: (context) => AddUser(),
          DetailPlayer.routeName: (context) => DetailPlayer(),
        },
      ),
    );
  }
}
