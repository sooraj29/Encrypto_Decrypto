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

  final int _selectedIndex=2;
  static const List _route=[Home(),Files(),About()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          backgroundColor: (Colors.grey[900])!,
          items: const <Widget>[
            Tooltip(
              child: Icon(Icons.home, size: 30, color:Colors.white),
              enableFeedback: false,
              message: "Home",
              showDuration: Duration(seconds: 5),
            ),
            Tooltip(
              child: Icon(Icons.file_download, size: 30, color:Colors.white),
              enableFeedback: false,
              showDuration: Duration(seconds: 5),
              message: "Downloaded\nFiles",
            ),
            Tooltip(
              child: Icon(Icons.info, size: 30, color:Colors.white),
              message: "About",
              enableFeedback: false,
              showDuration: Duration(seconds: 5),
            ),
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
        body:Column(
          children: [
            ListTile(
            tileColor: Colors.grey[800],
            leading: SizedBox(
              width: 52,
              height: 52,
              child: Icon(
                CupertinoIcons.info,
                color: Colors.white,
              ),
            ),
            title: Text(
              'About Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
            const SizedBox(height: 12,),
            Expanded(
              child: Text("About",
                style: TextStyle(fontSize: 30.0,
                color: Colors.white,),
              ),
            ),
          ],
        ),
    );
  }
}
