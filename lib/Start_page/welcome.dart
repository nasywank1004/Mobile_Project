import 'package:flutter/material.dart';
import 'package:reserveeats/BotNavBar_page/botnavbar.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
          ),
        ),
        child: Center(
          child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'WELCOME TO RESERVEEATS',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'cambay',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Divider(color: Colors.white),
                  Center(
                    child: Container(
                    margin: const EdgeInsets.all(10.0),
                    color: Colors.amber.withOpacity(0.5),
                    width: 300.0,
                    height: 400.0,
                    child: Text("RESERVEEATS come to serve you the reservation service to save your time, so you could reserve your beloved family or your precious partner into one of excellent restaurants we have here. You just have to click onto the restaurant you want, then pick your bunch menu (it’s optional). Last but not least, confirm your reservation. Don’t forget to check in to your restaurant! Because we have limits for your reservation around 3 hours since you did confirm your reservation.",
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400, height: 1.5),
                                textAlign: TextAlign.center,),
                    ),
                   ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>MyBottomNavigationBar()));
                    },
                    child: Text(
                      'BOOK NOW',
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
      )
    );
  }
}