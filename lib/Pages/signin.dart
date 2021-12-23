import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {

  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}


Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:Center(
        child: ElevatedButton(
        onPressed: () async {
          dynamic user = await signInWithGoogle();
        },
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Register",
            style: TextStyle(
              color: Colors.grey,
              // fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: 'Open-Sans',
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0.0,
          shadowColor: null,
        ),
        ),
          ),
    );
  }
}
