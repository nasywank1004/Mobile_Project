import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reserveeats/BotNavBar_page/booking_page.dart';
import 'package:reserveeats/Profile_page/pages/add_menu.dart';

class MenuTable extends StatefulWidget {
  @override
  _MenuTableState createState() => _MenuTableState();
}

class _MenuTableState extends State<MenuTable> {
  List _reservations = [];
  String? status;
  String? id;

  @override
  void initState() {
    super.initState();
    _fetchReservations();
  }

  Future<void> _fetchReservations() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/menu/all'));
    final data = json.decode(response.body)['results'] as List;

    setState(() {
      _reservations = data;
    });
  }

  Future<void> _updateStatus() async {
    final url = Uri.parse("http://10.0.2.2:5000/menu/update/${id}");
    // bool rememberMe = isRememberMe;

    final response = await http.post(url, body: {
      // 'nama_menu': menuController.text,
      'status': status,
    });
    _fetchReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ReserveEats"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddMenu()));
            },
          )
        ],
      ),
      body: Card(
        color: Colors.grey[300],
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(
          //         'https://media-cdn.tripadvisor.com/media/photo-w/17/f5/39/f7/fooood-at-the-food-department.jpg'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              horizontalMargin: 0, // set the horizontal margin to 0
              columns: [
                DataColumn(label: Text('Nama Menu')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Action')),
              ],
              rows: _reservations
                  .map(
                    (reservation) => DataRow(cells: [
                      DataCell(Text(reservation['nama_menu'])),
                      DataCell(Text(reservation['status'])),
                      DataCell(
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              status = reservation['status'] == "active"
                                  ? "disabled"
                                  : "active";
                              id = reservation["id"].toString();
                              _updateStatus();
                            });
                          },
                          child: Text(reservation['status'] == "active"
                              ? "Disable"
                              : "Activate"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      )
                    ]),
                  )
                  .toList(),
            ),
          ),
          color: Colors.white,
          // ),
        ),
      ),
    );
  }
}
