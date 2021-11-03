// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:encrypto_decrypto/firebase_api.dart';

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

  UploadTask? task;
  File? file;
  bool isdisabled = true;

  Future selectfile() async{
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ["pdf","doc"],
      type: FileType.custom,
    );
    if (result==null) return ;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);
      isdisabled = false;
    });
  }

  Future uploadfile() async{
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = '$fileName';
    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {
      file = null;
      isdisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    final filename = file !=null? basename(file!.path) : 'No File selected';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          backgroundColor: (Colors.grey[900])!,
          items: const <Widget>[
            Icon(Icons.home, size: 30, color:Colors.white),
            Icon(Icons.list, size: 30, color:Colors.white),
            Icon(Icons.info, size: 30, color:Colors.white),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
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
        body: PageView(
          children: [Center(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: selectfile,
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
                    IconButton(
                      onPressed: isdisabled? null : uploadfile,
                      icon: Icon(
                        Icons.upload_file_outlined,
                      ),
                      iconSize: 25.0,
                      color: Colors.white,
                      disabledColor: primaryBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  filename,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
          ),Container()],
        ),
      ),
    );
  }
}