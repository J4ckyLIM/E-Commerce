import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('App Test'),
      backgroundColor: Colors.red[600],
    ),
    body: Center(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter a search term',
        ),
      ),
    ),
  ),
));