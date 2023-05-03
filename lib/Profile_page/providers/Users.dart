import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:reserveeats/Profile_page/pages/add_user_page.dart';

import '../models/User.dart';

class Users with ChangeNotifier {
  List<User> _allUser = [];

  List<User> get allUser => _allUser;

  int get jumlahUser => _allUser.length;

  User selectById(String id) =>
      _allUser.firstWhere((element) => element.id == id);

  addUser (
    String name, String phone, String email, String image, BuildContext context) async {
    DateTime datetimeNow = DateTime.now();


    Uri url= Uri.parse("https://reserveeats-ee081-default-rtdb.firebaseio.com/users.json");

    try {
      final response = await http.post(url, body: json.encode(
      {
        "id": datetimeNow.toString(),
        "name": name,
        "phone": phone,
        "email": email,
        "imageUrl": image,
        "createdAt": datetimeNow.toString(),
      },
     ),
    );
        if(response.statusCode >= 200 && response.statusCode < 300) {
          _allUser.add(
            User(
              id: json.decode(response.body)["name"].toString(),
              name: name,
              phone: phone,
              email: email,
              imageUrl: image,
              createdAt: datetimeNow,
            ),
          );
          notifyListeners();
          } else {
            throw ("${response.statusCode}");
          }
    } catch (error) {
      throw (error);
    }
    }

  editUser(
    String id, String name, String phone, String email, String image, String text,) async {
    Uri url= Uri.parse("https://reserveeats-ee081-default-rtdb.firebaseio.com/users/$id.json");
    try {
      final response = await http.patch(url, body: json.encode(
      {
        "name": name,
        "phone": phone,
        "email": email,
        "imageUrl": image,
      },
     ),
    );

    if(response.statusCode >= 200 && response.statusCode < 300) {
       User selectPlayer = _allUser.firstWhere((element) => element.id == id);
        selectPlayer.name = name;
        selectPlayer.phone = phone;
        selectPlayer.email = email;
        selectPlayer.imageUrl = image;
        notifyListeners();
          } else {
            throw ("${response.statusCode}");
          }
    } catch (error) {
      throw(error);
    }
  }

  deleteUser (String id) async {
    Uri url= Uri.parse("https://reserveeats-ee081-default-rtdb.firebaseio.com/users/$id.json");
    try {
      final response = await http.delete(url)
        . then(
      (response) {
        _allUser.removeWhere((element) => element.id == id);
        notifyListeners();
        },
      ); 

      if(response.statusCode < 200 && response.statusCode >= 300) {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw(error);
    }
  }

  Future <void> initialData() async {
    Uri url= Uri.parse("https://reserveeats-ee081-default-rtdb.firebaseio.com/users.json");

    var hasilGetData =  await http.get(url);
  
    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;
      if (dataResponse != null) {
      dataResponse.forEach(
        (key, value) {
        DateTime dateTimeParse =
          DateFormat("yyyy-mm-dd hh:mm:ss"). parse(value["createdAt"]);
        _allUser.add(
          User(
          id: key,
          name: value["name"],
          phone: value["phone"],
          email: value["email"],
          imageUrl: value["imageUrl"],
          createdAt: dateTimeParse,
        ),
      );
    },
    );
  }
  notifyListeners();
  }

  
}
