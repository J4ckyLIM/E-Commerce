import 'package:flutter/material.dart';
//import 'package:/components/products.dart';
import '../home.dart';
import './shopping_cart.dart';


class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_picture;
  final product_detail_description;
  final product_detail_tag;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_price,
    this.product_detail_picture,
    this.product_detail_description,
    this.product_detail_tag,
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
        title: InkWell( 
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));},
        child: Text('Détails'),
        ),
        actions: <Widget>[ 
          // new IconButton( 
          //   icon: Icon( 
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   onPressed: (){}
          // ),
          new IconButton( 
            icon: Icon( 
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
            }
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),),
                  title: new Row(children: <Widget>[
                    Expanded( 
                      child: new Text("${widget.product_detail_price} \€",
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30.0),
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
              child: MaterialButton(
                onPressed: (){ 
                  showDialog(context: context,
                  builder: (context){
                    return AlertDialog( 
                      title: Text("Color"),
                      content: Text("Choose the quantity"),
                    );
                  });
                }, 
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
              child: MaterialButton(onPressed: (){
                showDialog(context: context,
                  builder: (context){
                    return AlertDialog( 
                      title: Text("Quantity"),
                      content: Text("Choose the quantity"),
                    );
                  });
              }, 
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
                  child: Text("Ajouter au panier"),
              ),
            ),
             IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.orange), onPressed: (){}),
             IconButton(icon: Icon(Icons.favorite_border, color: Colors.orange), onPressed: (){}),

            ],
          ),
          Divider(),
          ListTile( 
            title: Text("Product details"),
            //subtitle: Text("Matériel Spandex Dentelle Entretien des vêtements Lavage à une température maximale de 40 °CSans Manches Type de col: Charme du design transparent la dentelle florale, Col V, montrez vos courbes sexy Fait de tissu doux, il est confortable et respirant"),
            subtitle: Text("${widget.product_detail_description}"),
          ),
        ],
      ),
    );
  }
}