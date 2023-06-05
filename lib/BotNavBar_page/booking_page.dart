import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reserveeats/BotNavBar_page/reservation_table.dart';

class BookingNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedRoom;
  String? selectedPerson;
  String? selectedTime;
  String? selectedMenu;
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
        await http.get(Uri.parse('http://127.0.0.1:5000/menu/active'));
    final data = json.decode(response.body)['results'] as List;

    setState(() {
      _menus = data;
    });
  }

  Future<void> _submitBooking() async {
    final url = Uri.parse('http://127.0.0.1:5000/post/test');

    final response = await http.post(
      url,
      body: {
        'selectedRoom': selectedRoom,
        'selectedPerson': selectedPerson,
        'selectedTime': selectedTime,
        'menu': selectedMenu
      },
    );

    if (response.statusCode == 200) {
      // success handling
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hasil'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text('Berhasil')],
              ),
            ),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReservationTable()));
    } else {
      // error handling
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hasil'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('${response}'),
                  // Text('Selected Person : ${selectedPerson}'),
                  // Text('Selected Time : ${selectedTime}')
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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
          title: Text("ReserveEats",
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Reservasi Restoran',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<String?>(
                      hint: Text("Menu:"),
                      value: selectedMenu,
                      onChanged: (value) {
                        setState(() {
                          selectedMenu = value;
                        });
                      },
                      underline: SizedBox(),
                      isExpanded: true,
                      items:
                          _menus.map<DropdownMenuItem<String?>>((dynamic menu) {
                        final String menuName = menu['nama_menu'] as String;
                        return DropdownMenuItem<String?>(
                          value: menuName,
                          child: Text(menuName),
                        );
                      }).toList(),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String?>(
                      hint: Text("Waktu:"),
                      value: selectedTime,
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      },
                      underline: SizedBox(),
                      isExpanded: true,
                      items: ["10.00", "12.00", "15.00", "19.00"]
                          .map<DropdownMenuItem<String?>>(
                              (e) => DropdownMenuItem(
                                    child: Text(e.toString()),
                                    value: e,
                                  ))
                          .toList()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String?>(
                      hint: Text("Ruangan reservasi:"),
                      value: selectedRoom,
                      onChanged: (value) {
                        setState(() {
                          selectedRoom = value;
                        });
                      },
                      underline: SizedBox(),
                      isExpanded: true,
                      items: ["Biasa", "VIP"]
                          .map<DropdownMenuItem<String?>>(
                              (e) => DropdownMenuItem(
                                    child: Text(e.toString()),
                                    value: e,
                                  ))
                          .toList()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String?>(
                      hint: Text("Jumlah Orang:"),
                      value: selectedPerson,
                      onChanged: (value) {
                        setState(() {
                          selectedPerson = value;
                        });
                      },
                      underline: SizedBox(),
                      isExpanded: true,
                      items: ["2", "3", "4", "5", "6", "7", "8", "9", "10"]
                          .map<DropdownMenuItem<String?>>(
                              (e) => DropdownMenuItem(
                                    child: Text(e.toString()),
                                    value: e,
                                  ))
                          .toList()),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Notes:',
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
                  child: Text('Reserve Now'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
