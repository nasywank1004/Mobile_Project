import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

void main()=> runApp(profile());

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 229, 93),
        body: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage("https://assets.pikiran-rakyat.com/crop/0x0:736x923/x/photo/2022/01/11/3328390648.jpg") ,
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.teal,
                ),
                title: Text(
                  'Jeong Jaehyun', style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Alkatra',
                    fontSize: 20.0
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+62 897 2190 2132', style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Alkatra',
                    fontSize: 20.0
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.message,
                  color: Colors.teal,
                ),
                title: Text(
                  'JeongJaehyun@gmail.com', style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Alkatra',
                    fontSize: 20.0
                  ),
                ),
              ),
            ),

          ],
        )),
      ),
    );
  }
}