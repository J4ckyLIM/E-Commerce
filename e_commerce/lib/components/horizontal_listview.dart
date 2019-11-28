import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
<<<<<<< HEAD
=======
import 'package:vente/components/products_flash.dart';
>>>>>>> Hugo

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category( 
            image_location: 'images/cats/tshirt.png',
            image_caption: 'Vente flash',
          ),
          Category( 
            image_location: 'images/cats/dress.png',
            image_caption: 'Cuisine',
<<<<<<< HEAD
=======

>>>>>>> Hugo
          ),
          Category( 
            image_location: 'images/cats/jeans.png',
            image_caption: 'Informatique',
          ),
          Category( 
            image_location: 'images/cats/formal.png',
            image_caption: 'Jeux vidéo',
          ),
          Category( 
            image_location: 'images/cats/informal.png',
            image_caption: 'Maison',
          ),
          Category( 
            image_location: 'images/cats/shoe.png',
            image_caption: 'Mode',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
   final String image_location;
   final String image_caption;

   Category( {
     this.image_location,
     this.image_caption
   });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
<<<<<<< HEAD
    child: InkWell(onTap: (){},
=======
    child: InkWell(onTap: (){

      //Renvoie a Produit flash a changé !!!!
      
       Navigator.push(context, MaterialPageRoute(builder: (context) => Products_flash()));
    },
>>>>>>> Hugo
    child: Container( 
      width: 100.0,
    child: ListTile( 
      title: Image.asset(image_location, width: 100.0, height: 80.0,),
      subtitle: Container( 
        alignment: Alignment.topCenter,
        child: Text(image_caption, style: new TextStyle(fontSize: 11.0),
        ),
      ),
    ),
    ),
    ),
    );
  }
}
