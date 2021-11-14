// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'files.dart';
import 'home.dart';
import 'package:page_transition/page_transition.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  final int _selectedIndex=2;
  static const List _route=[Home(),Files(),About()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 30.0),backgroundColor: Colors.white,label: "Home"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.download_circle,size: 30.0),backgroundColor: Colors.grey,label: "Downloaded Files"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.info_circle_fill,size: 30.0),backgroundColor: Colors.grey,label: "About"),
          ],
          currentIndex: _selectedIndex,
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
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 40.0,),
            Text("About",
              style: TextStyle(fontSize: 30.0,
              color: Colors.white,),

            ),
            SizedBox(height: 70.0,),
            Text("The project aims to encrypt, upload and decrypt the documents using AES standard. \n\n\nMade By:\nSooraj S\nSiddhesh B\nSoorya SG",
                style: TextStyle(color:Colors.white, fontSize: 20.0,fontFamily: "open-sans"))
          ],
        ),
    );
  }
}
