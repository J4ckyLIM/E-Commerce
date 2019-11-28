import 'package:flutter/material.dart';
import 'package:vente/pages/product_details.dart';
class Products_flash extends StatefulWidget {
  @override
  _Products_flashState createState() => _Products_flashState();
}

class _Products_flashState extends State<Products_flash> {
  
  var product_flash_list = [
    // {
    //     "name": "Déguisement",
    //     "picture": "images/products/blazer1.jpeg",
    //     "price": 85,
    //     "quantity": 0, 
    //     "description": "Matériel Spandex Dentelle Entretien des vêtements Lavage à une température maximale de 40 °CSans Manches Type de col: Charme du design transparent la dentelle florale, Col V, montrez vos courbes sexy Fait de tissu doux, il est confortable et respirant"
    // },
    {
        "name": "Sac",
        "picture": "images/products/dress1.jpeg",
        "price": 50,
        "quantity": 0,
        "description": "ta"
    },
    {
        "name": "TV",
        "picture": "images/products/LGOLED.jpeg",
        "price": 1290,
        "quantity": 0,
    },
    {
        "name": "PC",
        "picture": "images/products/PC.jpeg",
        "price": 775,
        "quantity": 0,
    },
    {
        "name": "Switch",
        "picture": "images/products/switch.jpeg",
        "price": 300,
        "quantity": 0,
    },
    {
        "name": "switch Lite",
        "picture": "images/products/switchlite.jpeg",
        "price": 180,
        "quantity": 0,
    },
    {
        "name": "Playstation4",
        "picture": "images/products/ps4.jpeg",
        "price": 300,
        "quantity": 0,
    },
    {
        "name": "Pack xBox one X",
        "picture": "images/products/xbox.jpeg",
        "price": 320,
        "quantity": 0,
    },
    {
        "name": "Iphone11 Pro",
        "picture": "images/products/iphone.jpeg",
        "price": 1250,
        "quantity": 0,
    },
    {
        "name": "Souris Gamer",
        "picture": "images/products/corsair.jpeg",
        "price": 75,
        "quantity": 0,
    },
    {
        "name": "Clavier gaming",
        "picture": "images/products/razer.jpeg",
        "price": 110,
        "quantity": 0,
    },
    {
        "name": "Casque gamer",
        "picture": "images/products/asus.jpeg",
        "price": 100,
        "quantity": 0,
    },
    {
        "name": "Ecran gamer",
        "picture": "images/products/asusVG.jpeg",
        "price": 279,
        "quantity": 0,
    },
    {
        "name": "MacBook pro",
        "picture": "images/products/mac.jpeg",
        "price": 1515,
        "quantity": 0,
    },
    {
        "name": " Imac",
        "picture": "images/products/imac.jpeg",
        "price": 1275,
        "quantity": 0,
    },
    {
        "name": "Four Beko",
        "picture": "images/products/beko.jpeg",
        "price": 399,
        "quantity": 0,
    },
    {
        "name": "Lave vaiselle \n Siemens ",
        "picture": "images/products/vaiselle.jpeg",
        "price": 599,
        "quantity": 0,
    },
    {
        "name": "Lave linge \n Whirlpool",
        "picture": "images/products/whirlpool.jpeg",
        "price": 359,
        "quantity": 0,
    },
    {
        "name": "Sèche linge \n Bosch",
        "picture": "images/products/bosh.jpeg",
        "price": 589,
        "quantity": 0,
    },
    {
        "name": "Frigo \n congélateur",
        "picture": "images/products/frigo.jpeg",
        "price": 1850,
        "quantity": 0,
    },
    {
        "name": "Hotte Candy",
        "picture": "images/products/hotte.jpeg",
        "price": 139,
        "quantity": 0,
    },
    {
        "name": "Dyson v11",
        "picture": "images/products/dyson.jpeg",
        "price": 399,
        "quantity": 0,
    },
    {
        "name": "Trottinette \n Xiaomi",
        "picture": "images/products/xiaomi.jpeg",
        "price": 349,
        "quantity": 0,
    },
    {
        "name": "Cuisine \n companion \nMoulinex",
        "picture": "images/products/robot.jpeg",
        "price": 479,
        "quantity": 0,
    },
    {
        "name": "Balancelle bébé",
        "picture": "images/products/bebe.jpeg",
        "price": 169,
        "quantity": 0,
    },
    {
        "name": "Central vapeur\nCalor",
        "picture": "images/products/calor.jpeg",
        "price": 199,
        "quantity": 0,
    },
    {
        "name": "Chaise gaming \n Dxracer",
        "picture": "images/products/chaise.jpeg",
        "price": 298,
        "quantity": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {


    return GridView.builder(
      itemCount: product_flash_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2),
       itemBuilder: (BuildContext context, int index){
         return Single_prod( 
           prod_name: product_flash_list[index]['name'],
           prod_picture: product_flash_list[index]['picture'],
           prod_price: product_flash_list[index]['price'],
           prod_description: product_flash_list[index]['description'],
         );
       }
     );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_description;

  Single_prod( {
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_description,
  }
  );

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Hero(
        tag: Text("hero 1"), 
        child: Material( 
          child: InkWell(
            onTap: ()=> 
            Navigator.of(context).push(
               MaterialPageRoute(
                // Passage des valeurs a details des produits
                builder: (context) => ProductDetails( 
                  product_detail_name: prod_name,
                  product_detail_picture: prod_picture,
                  product_detail_price: prod_price,
                  product_detail_description: prod_description,
                ))),
          child: GridTile(
            footer: Container( 
              color: Colors.white70,
              child: ListTile( 
                leading: Text(
                  prod_name,
                   style: TextStyle(
                  fontWeight: FontWeight.bold ),
                  ),
                  title: Text(
                    "\$$prod_price", 
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.w800),),
              ),
            ),
            child: Image.asset(prod_picture,
            fit: BoxFit.cover,),
          ),
          ),
        ),
      ),
    );
  }
  
}