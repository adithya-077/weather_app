import "package:flutter/material.dart";
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_application_weather_app/screens/signin.dart';
import 'package:flutter_application_weather_app/screens/signup.dart';

class SigninAndRegister extends StatefulWidget {
  const SigninAndRegister({Key? key}) : super(key: key);

  @override
  _SigninAndRegisterState createState() => _SigninAndRegisterState();
}

class _SigninAndRegisterState extends State<SigninAndRegister> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'SIGN IN',
                icon: Icon(Icons.phonelink_sharp),
              ),
              Tab(
                text: 'SIGN UP',
                icon: Icon(
                  Icons.person_add,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SignIn(),
            SignUp(),
          ],
        ),
      ),
    );
  }
}
