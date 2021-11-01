// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/loading.dart';

void main() {

  runApp(MaterialApp(
    initialRoute: '/',
    routes:{
      '/':(context) => Loading(),
      'home':(context) => Home(),
      // 'about':(context) => About(),
    }
  ),
  );
}