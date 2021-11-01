// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent[100],
          title: Center(
            child: Text("Encrypto_Decrypto",
            style: TextStyle(
                color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(

                height: 100.0,
                child: RaisedButton(
                  onPressed: (){},

                  child: const Text(
                    "Encrypt",
                  ),
                  color: Colors.lightGreenAccent[100],
                  textColor: Colors.grey[800],
                ),
              ),
              RaisedButton(
                onPressed: (){},

                child: const Text(
                  "Decrypt",
                ),
                color: Colors.lightGreenAccent[100],
                textColor: Colors.grey[800],
              ),

            ],

          ),
        ),
      ),
    );
  }
}