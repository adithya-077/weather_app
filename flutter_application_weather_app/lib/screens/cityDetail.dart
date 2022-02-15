import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_weather_app/dataservice/jsonmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class CityWeatherDetail extends StatefulWidget {
  static final String routname = '/CityWeatherDetail';

  const CityWeatherDetail({
    Key? key,
  }) : super(key: key);

  @override
  _CityWeatherDetailState createState() => _CityWeatherDetailState();
}

class _CityWeatherDetailState extends State<CityWeatherDetail> {
  @override
  Widget build(BuildContext context) {
    final obj =
        ModalRoute.of(context)!.settings.arguments as Map<String, WeatherData>;
    final ob = obj['OP'];
    final screeSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        toolbarHeight: screeSize.height * 0.1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(42, 69, 84, 1.0)),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        iconTheme:
            IconThemeData(color: Color.fromRGBO(204, 143, 31, 1.0), size: 30),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(4.0, 4.0),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
            color: Color.fromRGBO(42, 69, 84, 1.0),
            border:
                Border.all(color: Color.fromRGBO(204, 143, 31, 1.0), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            ob!.cityName,
            style: GoogleFonts.staatliches(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(204, 143, 31, 1.0),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screeSize.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: screeSize.width,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  color: Color.fromRGBO(42, 69, 84, 1.0),
                  border: Border.all(
                      color: Color.fromRGBO(204, 143, 31, 1.0), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridTile(
                  child: GridTileBar(
                    title: Text('NOW AT ${ob.cityName.toUpperCase()}',
                        style: GoogleFonts.staatliches(
                            color: Color.fromRGBO(204, 143, 31, 1.0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.thermostat,
                      color: Color.fromRGBO(204, 143, 31, 1.0),
                    ),
                    trailing: Row(children: [
                      Text(
                        ob.citytemp.toString(),
                        style: GoogleFonts.staatliches(
                            color: Color.fromRGBO(204, 143, 31, 1.0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '  C°',
                        style: GoogleFonts.staatliches(
                            color: Color.fromRGBO(204, 143, 31, 1.0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screeSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  color: Color.fromRGBO(42, 69, 84, 1.0),
                  border: Border.all(
                      color: Color.fromRGBO(204, 143, 31, 1.0), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        Icons.cloud,
                        color: Color.fromRGBO(204, 143, 31, 1.0),
                        size: 50,
                      ),
                      Text(
                        ' / ',
                        style: GoogleFonts.staatliches(
                            color: Color.fromRGBO(204, 143, 31, 1.0),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.wb_sunny,
                        color: Color.fromRGBO(204, 143, 31, 1.0),
                        size: 50,
                      ),
                    ]),
                    Text(
                      ob.cityWeatherDiscription,
                      style: GoogleFonts.staatliches(
                          color: Color.fromRGBO(204, 143, 31, 1.0),
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: screeSize.width,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  color: Color.fromRGBO(42, 69, 84, 1.0),
                  border: Border.all(
                      color: Color.fromRGBO(204, 143, 31, 1.0), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridTile(
                  child: GridTileBar(
                    trailing: Text(ob.cityWindSpeed.toString(),
                        style: GoogleFonts.staatliches(
                            color: Color.fromRGBO(204, 143, 31, 1.0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.air_outlined,
                      color: Color.fromRGBO(204, 143, 31, 1.0),
                    ),
                    title: Text(
                      '  WIND SPEED',
                      style: GoogleFonts.staatliches(
                          color: Color.fromRGBO(204, 143, 31, 1.0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
