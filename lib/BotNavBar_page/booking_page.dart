import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReserveEats", textAlign: TextAlign.center, style: TextStyle(
                          color: Colors.white)),
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
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
              ),
            ),

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:10),
              child: Text(
                          'Reservasi Restoran',
                          
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white
                            ),
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
                      hint: Text("Jumlah orang:"),
                      value: selectedTime,
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      },
                      underline: SizedBox(),
                      isExpanded: true,
                      items: ["10.00", "12.00", "15.00", "19.00"]
                      .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(child: Text(e.toString()),
                      value: e,)).toList()
              ),
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
                      .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(child: Text(e.toString()),
                      value: e,)).toList()
              ),
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
                      hint: Text("Waktu reservasi:"),
                      value: selectedPerson,
                      onChanged: (value) {
                        setState(() {
                          selectedPerson = value;
                        });
                      },
                      underline: SizedBox(),
                      isExpanded: true,
                      items: ["2", "3", "4", "5", "6", "7", "8", "9", "10"]
                      .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(child: Text(e.toString()),
                      value: e,)).toList()
              ),
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
              )
          ]
          
        ),
        
        
      ),
      )
    );
  }
}