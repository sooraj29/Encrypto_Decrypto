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
            child: Text("Encrypto Decrypto",
            style: TextStyle(
                color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontFamily: 'Open-sans',
              fontSize: 30.0,
            ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,0.0,10.0,10.0),
                child: RichText(
                  text: TextSpan(
                    children: const [
                      TextSpan(
                        text: "Encrypt:",
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Open-sans",
                          color: Colors.white,
                        )
                        ,),
                      TextSpan(
                        text: " Upload a document for encrypting and saving it in your database",
                      ),
                    ],
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: (){},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text(
                    "Encrypt",
                    style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'Open-Sans',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0.0,
                  shadowColor: null,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,0.0,10.0,10.0),
                child: RichText(
                  text: TextSpan(
                    children: const [
                      TextSpan(
                        text: "Decrypt:",
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Open-sans",
                        color: Colors.white,
                      )
                        ,),
                      TextSpan(
                        text: " View a document from your database by decrypting it",
                      ),
                    ],
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              ElevatedButton(
                onPressed: (){},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text(
                    "Decrypt",
                    style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                        fontFamily: 'Open-Sans',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0.0,
                  shadowColor: null,
                ),
              ),

            ],

          ),
        ),
      ),
    );
  }
}