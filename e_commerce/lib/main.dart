import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'components/horizontal_listview.dart';
import 'components/products.dart';
import 'pages/about.dart';
import 'pages/shopping_cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: MyHomePage(),
      //home: About(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpg'),
          AssetImage('images/w3.jpg'),
          AssetImage('images/w4.jpg'),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
        dotSize: 6.0,
        indicatorBgPadding: 6.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('APPSHOP'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Jacky Lim'),
              accountEmail: Text('jackyLim@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.orange),
            ),
            InkWell(
              onTap: () {
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home,color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Products_flash()));
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Products()));
              },
              child: ListTile(
                title: Text('All articles'),
                leading: Icon(Icons.shopping_basket,color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Products_flash()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favorites'),
                leading: Icon(Icons.favorite,color: Colors.orange),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
              },
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //image carousel 
          image_carousel,
          //padding widget
          new Padding(
            padding: const EdgeInsets.all(8.0),
           // child: new Text('Categories'),
          ),
          //Horizontal 
          HorizontalList(),
          //padding widget
          new Padding(
            padding: const EdgeInsets.all(5.0),
            //child: new Text('products'),
          ),
          //grid view
          Container( 
            height: 450.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}
