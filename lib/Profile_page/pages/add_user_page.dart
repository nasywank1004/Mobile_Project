import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Users.dart';

class AddUser extends StatelessWidget {
  static const routeName = "/add-user";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController imageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context, listen: false);

    final VoidCallback addUser = () {
      users.addUser(
        nameController.text,
        phoneController.text,
        emailController.text,
        imageController.text,
        context,
      )

      .catchError((err) => showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("There was an ERROR $err"),
          content: Text("User tidak dapat ditambahkan"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text("OK")
            ),
          ],
        ),
      )
    )

        .then(
        (response) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Berhasil ditambahkan"),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        }
      ); 
    };



    return Scaffold(
      appBar: AppBar(
        title: Text("ReserveEats", style: TextStyle(
                          color: Colors.white)),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.white,),
            onPressed: addUser,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Name"),
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
                autofocus: true,
                decoration: InputDecoration(labelText: "Email"),
                textInputAction: TextInputAction.next,
                controller: emailController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: addUser,
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: addUser,
                  child: Text(
                    "Submit",
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
