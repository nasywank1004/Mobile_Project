import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../providers/Users.dart';
import 'dart:convert';

class DetailUser extends StatefulWidget {
  @override
  DetailUserState createState() => DetailUserState();
}

class DetailUserState extends State<DetailUser> {
  String? username;
  String? email;
  String? gender;
  String? foto;
  String? noTelp;
  String? alamat;
final TextEditingController usernameController =
        TextEditingController();
    final TextEditingController emailController =
        TextEditingController();
    final TextEditingController genderController =
        TextEditingController();
    final TextEditingController fotoController =
        TextEditingController();
    final TextEditingController noTelpController =
        TextEditingController();
    final TextEditingController alamatController =
        TextEditingController();
  

  @override
  void initState() {
    super.initState();
    _fetchData();
    
  }

  

  void _fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final url =
        Uri.parse('http://10.0.2.2:5000/getData/${prefs.getString("email")}');
    final response = await http.get(url);
    // setState(() {
    //   email = prefs.getString('email');
    //   username = prefs.getString('username');
    // });
    if (response.statusCode == 200) {
      final emailAcc = json.decode(response.body)["email"];
      final usernameAcc = json.decode(response.body)["username"];
      final fotoAcc = json.decode(response.body)["foto"];
      final noTelpAcc = json.decode(response.body)["no_telp"];
      final alamatAcc = json.decode(response.body)["alamat"];
      usernameController.text = usernameAcc;
      emailController.text = emailAcc;
      fotoController.text = fotoAcc;
      noTelpController.text = noTelpAcc;
      alamatController.text = alamatAcc;
      setState(() {
        username = usernameAcc;
        email = emailAcc;
        gender = gender;
        alamat = alamatAcc;
        noTelp = noTelpAcc;
        foto = fotoAcc;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hasil'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text('User Tidak Ditemukan')],
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
  

  Widget build(BuildContext context) {

    void onButtonPressed() async {
      final email = emailController.text;
      final username = usernameController.text;
      final foto = fotoController.text;
      final noTelp = noTelpController.text;
      final alamat = alamatController.text;
      final prefs = await SharedPreferences.getInstance();
      // prefs.getString("email");
      final url =
          Uri.parse("http://10.0.2.2:5000/update/${prefs.getString("email")}");
      // bool rememberMe = isRememberMe;

      final response = await http.post(url, body: {
        'email': email,
        'username': username,
        'foto': foto,
        'noTelp': noTelp,
        'alamat': alamat
      });

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hasil'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [Text('Berhasil Update Data')],
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

        _fetchData();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hasil'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [Text('Gagal Update Data')],
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("ReserveEats", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView(
            children: [
              TextFormField(
                autocorrect: false,
                // initialValue: username,
                autofocus: true,
                decoration: InputDecoration(labelText: "Username"),
                textInputAction: TextInputAction.next,
                controller: usernameController,
              ),
              TextFormField(
                autocorrect: true,
                decoration: InputDecoration(labelText: "Email"),
                textInputAction: TextInputAction.next,
                controller: emailController,
              ),
              TextFormField(
                autocorrect: true,
                decoration: InputDecoration(labelText: "Foto Link"),
                textInputAction: TextInputAction.next,
                controller: fotoController,
              ),
              TextFormField(
                autocorrect: true,
                decoration: InputDecoration(labelText: "No Telp"),
                textInputAction: TextInputAction.next,
                controller: noTelpController,
              ),
              TextFormField(
                autocorrect: true,
                decoration: InputDecoration(labelText: "Alamat"),
                textInputAction: TextInputAction.next,
                controller: alamatController,
              ),
              Divider(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                onPressed: () {
                  onButtonPressed();
                },
                child: Text("Edit Profile",
                    style: TextStyle(fontSize: 12, color: Colors.yellow[700])),
              ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
