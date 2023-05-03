import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:reserveeats/Cart_page/cartmodel.dart';

class HomePage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Hotdog",
        price: 20000,
        imgUrl: "https://www.seekpng.com/png/detail/7-71000_hot-dog-hot-dog-png-transparent.png",
        qty: 1),
    Product(
        id: 2,
        title: "Udon",
        price: 40000,
        imgUrl: "https://static.vecteezy.com/system/resources/thumbnails/009/583/124/small_2x/udon-japan-food-illustration-png.png",
        qty: 1),
    Product(
        id: 3,
        title: "Bakso",
        price: 20000,
        imgUrl: "https://png.pngtree.com/png-clipart/20220502/original/pngtree-mie-bakso-vector-cartoon-png-image_7650461.png",
        qty: 1),
    Product(
        id: 4,
        title: "Pizza",
        price: 33000,
        imgUrl: "https://media.istockphoto.com/id/1166383758/id/vektor/potongan-pizza-vektor-dalam-gaya-kartun-ikon-untuk-menu.jpg?s=612x612&w=0&k=20&c=Q-cTZRoutr-Ozbkf_Gx_AEqhrCUjr_ntZtDgkGGes8I=",
        qty: 1),
    Product(
        id: 5,
        title: "Steak",
        price: 65000,
        imgUrl: "https://png.pngtree.com/element_our/20190523/ourlarge/pngtree-cartoon-steak-vector-material-image_1077719.jpg",
        qty: 1),
    Product(
        id: 6,
        title: "Nasi Goreng",
        price: 30000,
        imgUrl: "https://media.istockphoto.com/id/943598568/id/vektor/fried-rice-or-nasi-goreng-in-bahasa-indonesia.jpg?s=170667a&w=0&k=20&c=wFlE_yfdSMNAJ747oU_6BenyfHW-HR036QR0fCsr67k=",
        qty: 1),
    Product(
        id: 7,
        title: "Nasi Campur",
        price: 22000,
        imgUrl: "https://static.vecteezy.com/system/resources/previews/007/949/295/original/hand-drawn-nasi-dagang-food-free-vector.jpg",
        qty: 1),
    Product(
        id: 8,
        title: "Hamburger",
        price: 30000,
        imgUrl: "https://img.freepik.com/premium-vector/illustration-burger-vector-fast-food-illustration_537078-149.jpg?w=2000",
        qty: 1),
    Product(
        id: 9,
        title: "Ice Cream",
        price: 5000,
        imgUrl: "https://cdn.pixabay.com/photo/2012/04/13/11/59/ice-cream-cone-32093_640.png",
        qty: 1),
    Product(
        id: 10,
        title: "Es Campur",
        price: 30000,
        imgUrl: "https://png.pngtree.com/png-clipart/20220923/ourmid/pngtree-es-buah-naga-mangga-melon-alpukat-segar-png-image_6212833.png",
        qty: 1),
    Product(
        id: 11,
        title: "Ayam Penyet",
        price: 15000,
        imgUrl: "https://media.istockphoto.com/id/639316024/id/vektor/ayam-penyet-ayam-goreng-pecah.jpg?s=170667a&w=0&k=20&c=rukNl9C7TJhMwoElxUt_SOfA_ywLKs5KtEBjuDXMAXY=",
        qty: 1),
    Product(
        id: 12,
        title: "Ikan Bakar",
        price: 30000,
        imgUrl: "https://img.pikbest.com/png-images/qiantu/vector-hand-drawn-cartoon-braised-fish_2599960.png!bw700",
        qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("ReserveEats"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body:
      GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.8),
        itemBuilder: (context, index){
          return ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
            return Card( child: Column( children: <Widget>[
              Image.network(_products[index].imgUrl, height: 120, width: 120,),
              Text(_products[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
              Text("\Rp."+_products[index].price.toString()),
              OutlinedButton(
                    child: Text("Add"),
                    onPressed: () => model.addProduct(_products[index]))
            ])); 
          });
        },
      ),

      // ListView.builder(
      //   itemExtent: 80,
      //   itemCount: _products.length,
      //   itemBuilder: (context, index) {
      //     return ScopedModelDescendant<CartModel>(
      //         builder: (context, child, model) {
      //       return ListTile(
      //           leading: Image.network(_products[index].imgUrl),
      //           title: Text(_products[index].title),
      //           subtitle: Text("\$"+_products[index].price.toString()),
      //           trailing: OutlineButton(
      //               child: Text("Add"),
      //               onPressed: () => model.addProduct(_products[index])));
      //     });
      //   },
      // ),

    );
  }
}