// ignore_for_file: prefer_const_constructors

import 'package:encrypto_decrypto/firebase_file.dart';
import 'package:flutter/material.dart';
import 'package:encrypto_decrypto/firebase_api.dart';

class SelectFile extends StatefulWidget {
  const SelectFile({Key? key}) : super(key: key);

  @override
  _SelectFileState createState() => _SelectFileState();
}

class _SelectFileState extends State<SelectFile> {

  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState()
  {
    super.initState();
    futureFiles = FirebaseApi.listAll('');
  }

  void getFile(file){
  Navigator.pop(context,file);
  }

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
    title: Text(
      file.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        color: Colors.white,
      ),
    ),
    onTap: (){getFile(file);},
  );

  Widget buildHeader(int length) => ListTile(
    tileColor: Colors.black45,
    leading: SizedBox(
      width: 52,
      height: 52,
      child: Icon(
        Icons.file_copy,
        color: Colors.white,
      ),
    ),
    title: Text(
      '$length Files',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "Select File",
                  style: TextStyle(
                color: Colors.white,
                    fontWeight: FontWeight.bold,
            ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: (){
              Navigator.pop(context,false);
            },
          ),
        ),
        body: FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
          builder: (context,snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting: return Center(child: CircularProgressIndicator(),);
              default: if(snapshot.hasError) {
                return Center(child: Text("Some error occured"),);
              } else {
                final files = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(files!.length),
                    const SizedBox(height: 12,),
                    Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (context, index) {
                            final file = files[index];
                            return buildFile(context, file);
                          },
                        )
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
