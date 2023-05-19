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
      final genderAcc = json.decode(response.body)["gender"];
      setState(() {
        username = usernameAcc;
        email = emailAcc;
        gender = gender;
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
    final TextEditingController usernameController =
        TextEditingController(text: username);
    final TextEditingController emailController =
        TextEditingController(text: email);
    final TextEditingController genderController =
        TextEditingController(text: gender);

    void onButtonPressed() async {
      final email = emailController.text;
      final username = usernameController.text;
      final prefs = await SharedPreferences.getInstance();
      // prefs.getString("email");
      final url =
          Uri.parse("http://10.0.2.2:5000/update/${prefs.getString("email")}");
      // bool rememberMe = isRememberMe;

      final response =
          await http.post(url, body: {'email': email, 'username': username});

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
      appBar: AppBar(
        title: Text("ReserveEats", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
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
              Divider(),
              ElevatedButton(
                onPressed: () {
                  onButtonPressed();
                },
                child: Text("Edit Profile",
                    style: TextStyle(fontSize: 12, color: Colors.yellow[700])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
