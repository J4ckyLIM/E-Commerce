import 'package:flutter/material.dart';
import 'package:vente/components/shopping_cart_products.dart';

import 'payment.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  //List<Products> shoppingList = ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('My cart'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: Shopping_Cart_Products(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text("Total:"),
              subtitle: Text("\$999"),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
                },
                child: Text("Checkout", style: TextStyle (color: Colors.white)),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}