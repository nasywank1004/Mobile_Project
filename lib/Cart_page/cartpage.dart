import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:reserveeats/Cart_page/cartmodel.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    void showCartAlertDialog(BuildContext context, CartModel cart) {
      // buat list item dengan data dari CartModel
      print(cart);
    }

    void _onButtonPressed() {
      // Tampilkan alert dengan nilai inputan
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Inputan Anda'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Email: Halo'),
                ],
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

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Cart"),
          actions: <Widget>[
            TextButton(
                child: Text(
                  "Clear",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => ScopedModel.of<CartModel>(context).clearCart())
          ],
        ),
        body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                    .cart
                    .length ==
                0
            ? Center(
                child: Text("No items in Cart"),
              )
            : Container(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: ScopedModel.of<CartModel>(context,
                              rebuildOnChange: true)
                          .total,
                      itemBuilder: (context, index) {
                        return ScopedModelDescendant<CartModel>(
                          builder: (context, child, model) {
                            return ListTile(
                              title: Text(model.cart[index].title),
                              subtitle: Text(model.cart[index].qty.toString() +
                                  " x " +
                                  model.cart[index].price.toString() +
                                  " = " +
                                  (model.cart[index].qty *
                                          model.cart[index].price)
                                      .toString()),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        model.updateProduct(model.cart[index],
                                            model.cart[index].qty + 1);
                                        // model.removeProduct(model.cart[index]);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        model.updateProduct(model.cart[index],
                                            model.cart[index].qty - 1);
                                        // model.removeProduct(model.cart[index]);
                                      },
                                    ),
                                  ]),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Total: \Rp. " +
                            ScopedModel.of<CartModel>(context,
                                    rebuildOnChange: true)
                                .totalCartValue
                                .toString() +
                            "",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[900], elevation: 0),
                        child: Text("BUY NOW",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onPressed: () {
                          // showCartAlertDialog(context, CartModel);
                        },
                      ))
                ])));
  }
}
