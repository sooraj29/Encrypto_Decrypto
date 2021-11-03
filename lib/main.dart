// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/loading.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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