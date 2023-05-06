import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reserveeats/BotNavBar_page/booking_page.dart';

class ReservationTable extends StatefulWidget {
  @override
  _ReservationTableState createState() => _ReservationTableState();
}

class _ReservationTableState extends State<ReservationTable> {
  List _reservations = [];

  @override
  void initState() {
    super.initState();
    _fetchReservations();
  }

  Future<void> _fetchReservations() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:1234/reservations'));
    final data = json.decode(response.body)['results'] as List;

    setState(() {
      _reservations = data;
    });
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookingNow()));
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
                DataColumn(label: Text('Room')),
                DataColumn(label: Text('Person')),
                DataColumn(label: Text('Time')),
              ],
              rows: _reservations
                  .map(
                    (reservation) => DataRow(cells: [
                      DataCell(Text(reservation['selectedRoom'])),
                      DataCell(Text(reservation['selectedPerson'])),
                      DataCell(Text(reservation['selectedTime'])),
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
