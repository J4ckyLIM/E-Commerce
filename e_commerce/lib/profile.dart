import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'package:firebase_database/firebase_database.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title, this.uid, this.username}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid; //include this
  final String username;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;
  FirebaseUser currentUser;

  @override
  initState() {
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }
  @override
  Widget build(BuildContext context){

        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                child: Text("Log Out"),
                textColor: Colors.white,
                onPressed: () {
                  FirebaseAuth.instance
                    .signOut()
                    .then((result) => 
                      Navigator.pushReplacementNamed(context, "/login"))
                    .catchError((err) => print(err));
                },
              )
            ],
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Text("Welcome " ),
            RaisedButton(
              child: Text('Back To HomeScreen'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () => Navigator.pushReplacementNamed(context, "/home")
            )
          ],
        ),
      ),
    );
  }
}