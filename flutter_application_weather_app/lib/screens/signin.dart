import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_weather_app/screens/homepage.dart';
//import 'package:firebase_core/firebase_core.dart';
//import '../models/user.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_application_weather_app/models/user.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    //print(user);
    return Scaffold(
      appBar: AppBar(
        title:
            Text('User(' + (user == null ? 'logged out' : 'logged in') + ')'),
      ),
      body: Column(
        children: [
          TextField(
            controller: emailInput,
          ),
          TextField(
            controller: passwordInput,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailInput.text, password: passwordInput.text)
                      .then((_) {
                    Navigator.pushNamed(context, MyHomePage.routName,
                        arguments: {'userObj': user});
                  });

                  setState(() {});
                } catch (e) {
                  SnackBar(
                    content: Text(e.toString()),
                    duration: Duration(seconds: 1),
                  );
                  setState(() {});
                }
              },
              child: Text('SIGN IN')),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                setState(() {});
              },
              child: Text('LOG OUT'))
        ],
      ),
    );
  }
}
