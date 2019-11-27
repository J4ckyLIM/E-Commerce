import 'package:flutter/material.dart';
import 'package:e_commerce/components/products.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_price,
    this.product_detail_picture,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar( 
        elevation: 0.1,
        backgroundColor: Colors.orange,
        title: Text('NTM'),
        actions: <Widget>[ 
          new IconButton( 
            icon: Icon( 
              Icons.search,
              color: Colors.white,
            ),
            onPressed: (){}
          ),
          new IconButton( 
            icon: Icon( 
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: (){}
          )
        ],
      ),
      body: new ListView( 
        children: <Widget>[ 
          new Container( 
            height: 300.0,
            child: GridTile( 
              child: Container( 
              color: Colors.white,
              child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container( 
                color: Colors.white70,
                child: ListTile( 
                  leading: new Text(widget.product_detail_name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  title: new Row(children: <Widget>[
                    Expanded( 
                      child: new Text("${widget.product_detail_price} \€",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],)
                ),
              ),
            ),
          ),


          // BUTTON APRES INFO DU PRODUITS
          Row(
            children: <Widget>[ 
              // POUR UN HABIT CHOIX DE LA SIZE 
            Expanded( 
              child: MaterialButton(onPressed: (){}, 
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(children: <Widget>[ 
                Expanded( 
                  child: Text("Color")
                ),
                Expanded( 
                  child: Icon(Icons.arrow_drop_down)
                ),
              ],)
              ),
            ),
            // CHOIX DE LA COULEUR
            Expanded( 
              child: MaterialButton(onPressed: (){}, 
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(children: <Widget>[ 
                Expanded( 
                  child: Text("Quantity")
                ),
                Expanded( 
                  child: Icon(Icons.arrow_drop_down)
                ),
              ],
              ),
              ),
            ),
          ],
          ),

            // BOUTON ROUGE
          Row( 
            children: <Widget>[ 
              Expanded( 
              child: MaterialButton(
              onPressed: (){}, 
              color: Colors.orange,
              textColor: Colors.white,
              elevation: 0.2,
                  child: Text("BUY FDP"),
              ),
            ),
            ],
          )
        ],
      ),
    );
  }
}