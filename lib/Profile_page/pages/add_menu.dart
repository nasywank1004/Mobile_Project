import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reserveeats/BotNavBar_page/menu_table.dart';
import 'package:reserveeats/BotNavBar_page/reservation_table.dart';

class AddMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String? selectedRoom;
  String? selectedPerson;
  String? selectedTime;
  String? selectedMenu;
  final TextEditingController menuController = TextEditingController();
  List _menus = [];

  // void _onButtonPressed() {
  // Tampilkan alert dengan nilai inputan
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return AlertDialog(
  //       title: Text('Inputan Anda'),
  //       content: SingleChildScrollView(
  //         child: ListBody(
  //           children: [
  //             Text('Selected Room : ${selectedRoom}'),
  //             Text('Selected Person : ${selectedPerson}'),
  //             Text('Selected Time : ${selectedTime}')
  //           ],
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           child: Text('OK'),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     );
  //   },
  // );
  Future<void> _fetchMenus() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/menu/active'));
    final data = json.decode(response.body)['results'] as List;

    setState(() {
      _menus = data;
    });
  }

  Future<void> _submitBooking() async {
    final url = Uri.parse("http://10.0.2.2:5000/menu/add");
    // bool rememberMe = isRememberMe;

    final response = await http.post(url, body: {
      'nama_menu': menuController.text,
      'status': 'active',
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MenuTable()));
  }
  // }

  @override
  void initState() {
    super.initState();
    _fetchMenus();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Menu",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.amber,
        ),
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Add Menu',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: menuController,
                        decoration: InputDecoration(
                          hintText: 'Nama Menu:',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        _submitBooking();
                      },
                      child: Text('Add Menu'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        onPrimary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }
}
