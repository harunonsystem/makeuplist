import 'package:flutter/material.dart';

final makeupAppbar = AppBar(
  backgroundColor: Colors.pinkAccent,
  centerTitle: true,
  title: Text('MakeupList'),
  flexibleSpace: Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.blueAccent, Colors.pinkAccent])),
  ),
);

final loginAppbar = AppBar(
  backgroundColor: Colors.pinkAccent,
  centerTitle: true,
  title: Text('LoginPage'),
  flexibleSpace: Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.blueAccent, Colors.pinkAccent])),
  ),
);
