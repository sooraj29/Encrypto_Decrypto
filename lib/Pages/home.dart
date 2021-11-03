// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;
class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(

          backgroundColor: primaryBlack,
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
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'Open-Sans',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: primaryBlack,
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
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                        fontFamily: 'Open-Sans',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: primaryBlack,
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