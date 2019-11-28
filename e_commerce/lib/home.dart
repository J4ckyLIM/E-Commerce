import 'dart:developer';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/customCard.dart';
import 'components/horizontal_listview.dart';
import 'shopping_cart.dart';
import 'admin.dart';
import 'components/products.dart';
import 'pages/shopping_cart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid; //include this

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseUser currentUser;

  @override
  initState() {
    this.getCurrentUser();
    super.initState();
  }
  String _userId;
  String _userName;
  String _userMail;

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }
  @override
    Widget build(BuildContext context) {
  FirebaseAuth.instance.currentUser().then((user) {
      _userId = user.uid;
      _userName = user.displayName;
      _userMail = user.email;
    });
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
        title: Text('ShopOne'),
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
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
             // accountName: Text(_userName).data,
             //accountEmail: Text("" + _userMail),//Text(_userMail),
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
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {
                  Navigator.pushReplacementNamed(context, "/profile")
                  .catchError((err) => print(err));

              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Dashboard'),
                leading: Icon(Icons.dashboard, color: Colors.orange),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favorites'),
                leading: Icon(Icons.favorite, color: Colors.orange),
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
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Admin()));
              },
              child: ListTile(
                title: Text('Admin'),
                leading: Icon(Icons.airplanemode_active),
              ),
            ),
            InkWell(
                  onTap: () {
                    FirebaseAuth.instance
                    .signOut()
                    .then((result) =>
                      Navigator.pushReplacementNamed(context, "/login"))
                      .catchError((err) => print(err));
                  },
                  child: ListTile(
                    title: Text('Log out'),
                    leading: Icon(Icons.exit_to_app),
                  ),
              ),
            ],
        ),
      ),
      body: Column(
        children: <Widget>[
          //image carousel begins here
          image_carousel,
          //padding widget
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment:  Alignment.centerLeft,
              child: Text('Categories'),
            ),
          ),
          //Horizontal List view begins here
          HorizontalList(),
          //padding widget
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment:  Alignment.centerLeft,
              child: Text('Recent products'),
            ),
          ),
          Container(
            height: 450.0,
            child: Products(),
          ),
          //grid view
          Flexible( 
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection("users")
                  .document(widget.uid)
                  .collection('tasks')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    return new ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new CustomCard(
                          title: document['title'],
                          description: document['description'],
                        );
                      }).toList(),
                    );
                }
              },
            )),
        ],
      ),
    );
  }
}

/*  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          children: <Widget>[
            Text("Please fill all fields to create a new task"),
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Task Title*'),
                controller: taskTitleInputController,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'Task Description*'),
                controller: taskDescripInputController,
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                taskTitleInputController.clear();
                taskDescripInputController.clear();
                Navigator.pop(context);
              }),
          FlatButton(
              child: Text('Add'),
              onPressed: () {
                if (taskDescripInputController.text.isNotEmpty &&
                    taskTitleInputController.text.isNotEmpty) {
                  Firestore.instance
                      .collection("users")
                      .document(widget.uid)
                      .collection('tasks')
                      .add({
                        "title": taskTitleInputController.text,
                        "description": taskDescripInputController.text
                      })
                      .then((result) => {
                            Navigator.pop(context),
                            taskTitleInputController.clear(),
                            taskDescripInputController.clear(),
                          })
                      .catchError((err) => print(err));
                }
              })
        ],
      ),
    );
  } 
}*/