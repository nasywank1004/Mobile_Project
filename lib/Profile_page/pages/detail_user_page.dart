import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Users.dart';

class DetailPlayer extends StatelessWidget {
  static const routeName = "/detail-user";

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context, listen: false);
    final UserId = ModalRoute.of(context)?.settings.arguments as String;
    final created = ModalRoute.of(context)?.settings.arguments as String;
    final selectPLayer = users.selectById(UserId);
    final TextEditingController imageController =
        TextEditingController(text: selectPLayer.imageUrl);
    final TextEditingController nameController =
        TextEditingController(text: selectPLayer.name);
    final TextEditingController phoneController =
        TextEditingController(text: selectPLayer.phone);
    final TextEditingController emailController =
        TextEditingController(text: selectPLayer.email);
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
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 150,
                  height: 150,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageController.text,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      height: 50,
                      width: 50,
                      child: Image.network(
                          "https://i.pinimg.com/originals/09/04/9a/09049aa9d6e8cb79674ab772702b8c9b.jpg"),
                    ),
                  ),
                ),
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Phone"),
                textInputAction: TextInputAction.next,
                controller: phoneController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Email"),
                textInputAction: TextInputAction.next,
                controller: emailController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  users
                      .editUser(
                          UserId,
                          nameController.text,
                          phoneController.text,
                          emailController.text,
                          imageController.text,
                          created)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Berhasil diubah"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                  });
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    users
                        .editUser(
                            UserId,
                            nameController.text,
                            phoneController.text,
                            emailController.text,
                            imageController.text,
                            created)
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil diubah"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
