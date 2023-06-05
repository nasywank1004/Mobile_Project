import 'package:flutter/material.dart';
import 'package:reserveeats/Start_page/welcome.dart';
import 'package:reserveeats/BotNavBar_page/botnavbar.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://media-cdn.tripadvisor.com/media/photo-w/17/f5/39/f7/fooood-at-the-food-department.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken)),
            ),
            child: Center(
              child: Container(
                  padding: EdgeInsets.only(top: 300, left: 30, bottom: 30),
                  child: Column(
                    children: [
                      Text(
                        'WELCOME TO RESERVEEATS',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'cambay',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        height: 30,
                        indent: 3,
                        endIndent: 3,
                      ),
                      Text(
                        'You Click it,\n' + 'We Got It',
                        style: TextStyle(
                            fontFamily: 'cambay', color: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyBottomNavigationBar()));
                        },
                        child: Text(
                          'EXPLORE NOW!',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
