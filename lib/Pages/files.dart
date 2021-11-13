// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';
import 'package:page_transition/page_transition.dart';
import 'about.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';




class Files extends StatefulWidget {
  const Files({Key? key}) : super(key: key);

  @override
  _FilesState createState() => _FilesState();
}

class _FilesState extends State<Files> {

  final int _selectedIndex = 1;
  static const List _route = [Home(), Files(), About()];
  List Files_list = [];

  Future getlist() async {
    final dir = (await getExternalStorageDirectory())!.path;
    setState(() {
      Files_list = Directory(dir).listSync();
    });
  }

  var refreshKey = GlobalKey<RefreshIndicatorState>();


    @override
    void initState() {
      super.initState();
      getlist();
    }

    Widget buildFile(BuildContext context, dynamic file) =>
        ListTile(
          title: Text(
            file.path.substring(77, file.path.length - 1),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Colors.white,
            ),
          ),
          onTap: () async {
            await OpenFile.open(file.path.substring(7, file.path.length - 1));
          },
        );

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          backgroundColor: (Colors.grey[900])!,
          items: const <Widget>[
            Tooltip(
              child: Icon(Icons.home, size: 30, color: Colors.white),
              enableFeedback: false,
              message: "Home",
              showDuration: Duration(seconds: 5),
            ),
            Tooltip(
              child: Icon(Icons.file_download, size: 30, color: Colors.white),
              enableFeedback: false,
              showDuration: Duration(seconds: 5),
              message: "Downloaded\nFiles",
            ),
            Tooltip(
              child: Icon(Icons.info, size: 30, color: Colors.white),
              message: "About",
              enableFeedback: false,
              showDuration: Duration(seconds: 5),
            ),
          ],
          index: _selectedIndex,
          onTap: (index) {
            Navigator.pushReplacement(context, PageTransition(
                child: _route[index], type: PageTransitionType.fade));
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
        body: RefreshIndicator(
          onRefresh: refreshList,
          key: refreshKey,
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.grey[800],
                leading: SizedBox(
                  width: 52,
                  height: 52,
                  child: Icon(
                    Icons.file_copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Downloaded Files',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Expanded(
                child: ListView.builder(
                    itemCount: Files_list.length,
                    itemBuilder: (context, index) {
                      final file = File(Files_list[index].toString());
                      return buildFile(context, file);
                    }
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: ElevatedButton(
        //   child: Text("File Manager"),
        //   onPressed: (){},
        // ),
      );
    }
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      getlist();
    });
  }
}