import 'package:flutter/material.dart';

var makeupAppbar = AppBar(
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
