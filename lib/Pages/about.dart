// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'files.dart';
import 'home.dart';
import 'package:page_transition/page_transition.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  int _selectedIndex=2;
  static const List _route=[Home(),Files(),About()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          backgroundColor: (Colors.grey[900])!,
          items: const <Widget>[
            Icon(Icons.home, size: 30, color:Colors.white),
            Icon(Icons.list, size: 30, color:Colors.white),
            Icon(Icons.info, size: 30, color:Colors.white),
          ],
          index: _selectedIndex,
          onTap: (index) {
            Navigator.pushReplacement(context, PageTransition(child: _route[index], type: PageTransitionType.fade));
            //Handle button tap
          },
        ),
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text("Encrypto Decrypto",
              style: TextStyle(
                color: Colors.grey[300],
                fontWeight: FontWeight.bold,
                fontFamily: 'Open-sans',
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text("About",
                style: TextStyle(fontSize: 30.0,
                color: Colors.white,),

              ),
              Text("The project aims to encrypt, upload and decrypt the documents using AES standard. \nMade By:\nSooraj S\nSiddhesh B\nSoorya SG",
                  style: TextStyle(color:Colors.white, fontSize: 20.0,fontFamily: "open-sans"))
            ],
          ),
          
        ),
    );
  }
}
