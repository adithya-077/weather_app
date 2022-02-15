import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/screens/cityDetail.dart';
import 'package:flutter_application_weather_app/screens/login_signup_register.dart';
import 'package:flutter_application_weather_app/screens/userprofile.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import './screens/homepage.dart';
import './dataservice/dataservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Data()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => SigninAndRegister(),
        CityWeatherDetail.routname: (_) => CityWeatherDetail(),
        MyHomePage.routName: (_) => MyHomePage(),
        UserProfile.routName: (_) => UserProfile(),
      },
    );
  }
}
