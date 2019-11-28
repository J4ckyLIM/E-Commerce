import 'package:flutter/material.dart';

class Shopping_Cart_Products extends StatefulWidget {
  @override
  _Shopping_Cart_ProductsState createState() => _Shopping_Cart_ProductsState();
}

class _Shopping_Cart_ProductsState extends State<Shopping_Cart_Products> {

  var Products_in_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "quantity": 1,
    },
    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 50,
      "quantity": 2,
    },
  ]; 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_in_cart.length,
      itemBuilder: (context, index){
        return Single_cart_product(
          cart_prod_name: Products_in_cart[index]["name"],
          cart_prod_price: Products_in_cart[index]["price"],
          cart_prod_quantity: Products_in_cart[index]["quantity"],
          cart_prod_picture: Products_in_cart[index]["picture"],
          );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {

  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_quantity;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading section
        leading: Image.asset(cart_prod_picture, height: 150.0,),
        // Title section
        title: Text(cart_prod_name),
        subtitle: Column(
          children: <Widget>[
            // Row inside column
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Quantity:"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("${cart_prod_quantity}", style: TextStyle(color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 5, 0),
                  child: IconButton(icon: Icon(Icons.remove), onPressed: (){}),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text("${cart_prod_quantity}"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add), onPressed: (){}),
                ),
              ],
            ),    

            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                "\$${cart_prod_price}", 
                style: TextStyle(
                  color: Colors.red, 
                  fontSize: 17.0, 
                  fontWeight: FontWeight.bold
                  )
                ),
            ),
          ],
        ),
        // trailing: Column(
        //   children: <Widget>[
        //     IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
        //     Text("${cart_prod_quantity}"),
        //     IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
        //   ],
        // ),
      ),
    );
  }
  void addQuantity(){
      
  }
}