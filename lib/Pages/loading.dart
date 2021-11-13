// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void strttime() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  void initState(){
    super.initState();
    strttime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCircle(
            color: Colors.grey[100],
            size: 100.0,
          ),
          Text(
              "Loading",
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: "Open-sans",
              color: Colors.lightGreen[700],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}