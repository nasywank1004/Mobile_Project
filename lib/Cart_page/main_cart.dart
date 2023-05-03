import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:reserveeats/Cart_page/cartmodel.dart';
import 'package:reserveeats/Cart_page/cartpage.dart';
import 'package:reserveeats/Cart_page/home.dart';
import 'package:reserveeats/Cart_page/main_cart.dart';


class Cart extends StatelessWidget{

  final CartModel model;

  const Cart({Key? key, required this.model}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<CartModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        home: HomePage(),
        routes: {'/cart': (context) => CartPage()},
      ),
    );
  }
}