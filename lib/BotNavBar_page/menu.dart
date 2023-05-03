import 'package:flutter/material.dart';
import 'package:reserveeats/BotNavBar_page/detail.dart';
import 'package:reserveeats/Drawer_page/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ReserveEats"),
        backgroundColor: Colors.amber,
      ),
      drawer: Drawer(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [MyHeaderDrawer(), MyDrawerList()],
          ),
        ),
      )),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 25.0, right: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        buildTopChip("healthy", true),
                        buildTopChip("italian", false),
                        buildTopChip("mexican", false),
                        buildTopChip("asian", false),
                        buildTopChip("chinese", false),
                        buildTopChip("haitian", false),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Expanded(
                  child: ListView(
                children: <Widget>[
                  buildItem(
                      "Marugame Udon",
                      "123 reviews = S. Oxford 13th",
                      "https://3.bp.blogspot.com/-qTPdKy5Wqs4/VdQGaa48DbI/AAAAAAAAGGY/1Sius1YThGk/s1600/marugame%2Budon%2B1.jpg",
                      4.5),
                  buildItem(
                      "Solaria",
                      "98 reviews = S. Gulier 6th",
                      "https://plazaslipijaya.com/wp-content/uploads/2022/01/Solaria-di-Plaza-Slipi-Jaya.jpg",
                      4.5),
                  buildItem(
                      "Pan & Co",
                      "123 reviews = S. Oxford 13th",
                      "https://www.bigmall.co.id/images/2022/12/08/WhatsApp%20Image%202022-12-08%20at%2010.51.161_large.jpg",
                      4.5),
                  buildItem(
                      "RAMENYA!",
                      "123 reviews = S. Oxford 13th",
                      "https://anekatempatwisata.com/wp-content/uploads/2022/12/Tampak-Depan-Ramen-Ya-1200x600.png",
                      4.5),
                  buildItem(
                      "Restoran SEDERHANA ",
                      "123 reviews = S. Oxford 13th",
                      "https://media-cdn.tripadvisor.com/media/photo-s/09/2d/f9/a7/restoran-padang-sederhana.jpg",
                      4.5),
                  buildItem(
                      "Mr. Suprek",
                      "123 reviews = S. Oxford 13th",
                      "https://10619-2.s.cdn12.com/rests/original/109_509784086.jpg",
                      4.5),
                  buildItem(
                      "Rawon Setan",
                      "123 reviews = S. Oxford 13th",
                      "https://www.ngopibareng.id/images/imagecache/20210402123725rawon-setan-surabaya.jpg",
                      4.5),
                  buildItem(
                      "Simpang Raya ",
                      "123 reviews = S. Oxford 13th",
                      "https://img.restaurantguru.com/r568-dishes-Restoran-Simpang-Raya-2021-09-3.jpg",
                      4.5),
                  buildItem(
                      "Bakso Afung",
                      "123 reviews = S. Oxford 13th",
                      "https://www.centralparkjakarta.com/wp-content/uploads/2022/07/A-Fung-Photo.jpg",
                      4.5),
                  buildItem(
                      "Yoshinoya",
                      "123 reviews = S. Oxford 13th",
                      "https://kaltimfaktual.co/wp-content/uploads/2022/12/yoshinoya.jpeg",
                      4.5),
                  buildItem(
                      "Kimukatsu",
                      "123 reviews = S. Oxford 13th",
                      "https://tempat.com/blog/wp-content/uploads/2019/10/1f3a0c98-d03d-4534-b527-d823fd51178c.jpg",
                      4.5),
                  buildItem(
                      "Sushi Tei",
                      "123 reviews = S. Oxford 13th",
                      "https://bersamadakwah.net/wp-content/uploads/2015/08/Sushi-Tei-Bandung-4.jpg",
                      4.5),
                  buildItem(
                      "Bakmi GM",
                      "123 reviews = S. Oxford 13th",
                      "https://plaza-senayan.com/wordpress/wp-content/uploads/WhatsApp-Image-2022-11-10-at-16.48.15-1200x900.jpeg",
                      4.5),
                  buildItem(
                      "Waroeng Pak Muh",
                      "123 reviews = S. Oxford 13th",
                      "https://satutenda.com/wp-content/uploads/2022/07/Waroeng-Pak-Muh-Bintaro.jpg",
                      4.5),
                  buildItem(
                      "Rustic Market",
                      "123 reviews = S. Oxford 13th",
                      "https://cdn1-production-images-kly.akamaized.net/JRxyh9JnnT2bNO3XHldBz2K5sq8=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4088135/original/040711700_1657729696-Rustic_Market_Surabaya.jpg",
                      4.5),
                  buildItem(
                      "KOMUNITAS Coffee",
                      "123 reviews = S. Oxford 13th",
                      "https://liburanyuk.co.id/wp-content/uploads/2021/06/heylints-819x1024.jpg",
                      4.5),
                  buildItem(
                      "Lumer+",
                      "123 reviews = S. Oxford 13th",
                      "https://1.bp.blogspot.com/-zsWyf20hQ6c/XXiVPodMiUI/AAAAAAAAXaQ/t-77ARHsszE_QG6XVIJO0ES92PIsr3RkwCLcBGAsYHQ/s1600/IMG_8714.JPG",
                      4.5),
                  buildItem(
                      "SERLOK Kopi",
                      "123 reviews = S. Oxford 13th",
                      "https://api.showbizdeal.id/media-service/img/1CFYSwvbKM6L1bzZeBbB7o.jpg?fm=jpg",
                      4.5),
                  buildItem(
                      "Steak Moen Moen",
                      "123 reviews = S. Oxford 13th",
                      "https://www.gotravelly.com/assets/img/culinary/gallery/2021/06/d1ff2a44b381e1b493c9296b60a8884c.jpg",
                      4.5),
                  buildItem(
                      "STEAKLAB",
                      "123 reviews = S. Oxford 13th",
                      "https://10619-2.s.cdn12.com/rests/small/h200/108_514641961.jpg",
                      4.5),
                  buildItem(
                      "Depot Bu Rudy",
                      "123 reviews = S. Oxford 13th",
                      "https://depotburudy.co.id/wp-content/uploads/2020/04/Screen-Shot-2020-04-13-at-08.13.47.jpg",
                      4.5),
                  buildItem(
                      "NIHONMARU",
                      "123 reviews = S. Oxford 13th",
                      "https://www.gotravelly.com/assets/img/culinary/gallery/2022/06/b8881a9800672b88e67c0b7d58ba8d63.jpg",
                      4.5),
                  buildItem(
                      "SHUSIKUN",
                      "123 reviews = S. Oxford 13th",
                      "https://sushikun.id/wp-content/uploads/2020/02/DSCF2068-scaled.jpg",
                      4.5),
                  buildItem(
                      "PEPPERLUNCH",
                      "123 reviews = S. Oxford 13th",
                      "https://cms.lippomallpuri.com/assets/img/tenant/2cc61e2f06.jpg",
                      4.5),
                  buildItem(
                      "Kimchi-Go",
                      "123 reviews = S. Oxford 13th",
                      "https://teamgembul.files.wordpress.com/2012/09/kimchi-go-galaxy.jpg",
                      4.5),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildItem(
      String title, String subTitle, String url, double rating) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => DetailPage(url)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: url,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTopChip(String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        padding: EdgeInsets.all(8.0),
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}