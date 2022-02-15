import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/services/database.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController displaynameInput = TextEditingController();
  final TextEditingController dpUrlInput = TextEditingController();
  final TextEditingController displayCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: [
          TextField(
              controller: emailInput,
              decoration: InputDecoration(hintText: 'email')),
          TextField(
            controller: passwordInput,
            decoration: InputDecoration(hintText: 'password'),
          ),
          TextField(
              controller: displaynameInput,
              decoration: InputDecoration(hintText: 'display name')),
          TextField(
              controller: dpUrlInput,
              decoration: InputDecoration(hintText: 'image url')),
          TextField(
              controller: displayCity,
              decoration: InputDecoration(hintText: 'display city')),
          ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailInput.text, password: passwordInput.text);

                  await DatabaseService(uid: user?.uid).updateUserData(
                      dname: displaynameInput.text,
                      dpic: dpUrlInput.text,
                      dcity: displayCity.text);

                  setState(() {});
                } catch (e) {
                  SnackBar(
                    content: Text(e.toString()),
                    duration: Duration(seconds: 1),
                  );
                }
              },
              child: Text('SIGN UP'))
        ],
      ),
    );
  }
}
