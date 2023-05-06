import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'detail_user_page.dart';
import 'add_user_page.dart';

import '../providers/Users.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<Users>(context).initialData();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    isInit = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allUserProvider = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ReserveEats", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddUser.routeName);
            },
          ),
        ],
      ),
      body: (allUserProvider.jumlahUser == 0)
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Data",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddUser.routeName);
                    },
                    child: Text(
                      "Add User",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: allUserProvider.jumlahUser,
              itemBuilder: (context, index) {
                var id = allUserProvider.allUser[index].id;
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPlayer.routeName,
                      arguments: id,
                    );
                  },
                  // leading: CircleAvatar(
                  //  backgroundImage: NetworkImage(
                  //    ,
                  // ),
                  //),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: CachedNetworkImage(
                        imageUrl: allUserProvider.allUser[index].imageUrl,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Container(
                          height: 50,
                          width: 50,
                          child: Image.network(
                              "https://i.pinimg.com/originals/09/04/9a/09049aa9d6e8cb79674ab772702b8c9b.jpg"),
                        ),
                      ),
                    ),
                  ),

                  title: Text(
                    allUserProvider.allUser[index].name,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd()
                        .format(allUserProvider.allUser[index].createdAt),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      allUserProvider.deleteUser(id).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil dihapus"),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
