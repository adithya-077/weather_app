import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_weather_app/dataservice/jsonmodel.dart';
import 'package:http/http.dart' as http;

class Data with ChangeNotifier {
  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  Future<WeatherData> getRequest(String city) async {
    //print(city);
    final api = 'b247e392dee5996feec6d23cdc22b358';
    final queryParameter = {'q': city, 'appid': api, 'units': 'metric'};
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameter);
    final response = await http.get(uri);

    // print(response.body);
    notifyListeners();

    return WeatherData.fromJson(jsonDecode(response.body));
  }
}
