// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print
import 'package:encrypto_decrypto/firebase_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:encrypto_decrypto/firebase_api.dart';
import 'files.dart';
import 'about.dart';

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
  File? encryptfile;
  FirebaseFile? decryptfile;
  bool isencryptdisabled = true;
  bool isdecryptdisabled = true;

  Future encrypt_selectfile() async{
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ["pdf","doc","docx"],
      type: FileType.custom,
    );
    if (result==null) return ;
    final path = result.files.single.path!;
    setState(() {
      encryptfile = File(path);
      isencryptdisabled = false;
    });
  }

  Future uploadfile() async{
    if (encryptfile == null) return;
    final fileName = basename(encryptfile!.path);
    final destination = fileName;
    task = FirebaseApi.uploadFile(destination, encryptfile!);
    setState(() {
      encryptfile = null;
      isencryptdisabled = true;
    });
  }

  Future downloadfile() async{
    if(decryptfile == null) return;
    await FirebaseApi.downloadFile(decryptfile!.ref);
    setState(() {
      decryptfile = null;
      isdecryptdisabled = true;
    });
  }

  int _selectedIndex=0;
  static const List _route=[Home(),Files(),About()];

  @override
  Widget build(BuildContext context) {

    final encryptfilename = encryptfile !=null? basename(encryptfile!.path) : 'No File selected';
    final decryptfilename = decryptfile !=null? decryptfile!.name : 'No File selected';

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
        body: Column(
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
                    onPressed: encrypt_selectfile,
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
                    onPressed: isencryptdisabled? null : uploadfile,
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
                encryptfilename,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      dynamic dfile = await Navigator.pushNamed(context,'selectfile');
                      print(dfile);
                      setState(() {
                        decryptfile=dfile;
                        isdecryptdisabled = dfile==null ? true : false;
                      });
                    },
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
                  IconButton(
                    onPressed: isdecryptdisabled? null : downloadfile,
                    icon: Icon(
                      Icons.download_outlined,
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
                decryptfilename,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
        ),
    );
  }
}