class WindData {
  double windSpeed;
  WindData({required this.windSpeed});

  factory WindData.fromJason(Map<String, dynamic> json) {
    final double windSpeed = json['wind']['speed'];
    return WindData(windSpeed: windSpeed);
  }
}

class WeatherMain {
  String description;

  WeatherMain({required this.description});

  factory WeatherMain.fromJason(Map<String, dynamic> json) {
    final weatherDiscription = json['description'];
    return WeatherMain(description: weatherDiscription);
  }
}

class Tempdata {
  double temp;

  Tempdata({required this.temp});

  factory Tempdata.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    return Tempdata(temp: temp);
  }
}

class WeatherData {
  String cityName;
  double citytemp;
  String cityWeatherDiscription;
  double cityWindSpeed;

  WeatherData({
    required this.cityName,
    required this.citytemp,
    required this.cityWeatherDiscription,
    required this.cityWindSpeed,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      final cityName = json['name'];

      final Map<String, dynamic> tempMainInfo = json['main'];
      final tempinfo = Tempdata.fromJson(tempMainInfo);
      final citytemp = tempinfo.temp;

      final discinfo = json['weather'];
      final tempDisc = WeatherMain.fromJason(discinfo[0]);
      final cityWeatherDiscription = tempDisc.description;

      final wSpeedinfo = WindData.fromJason(json);

      return WeatherData(
        cityName: cityName,
        citytemp: citytemp,
        cityWeatherDiscription: cityWeatherDiscription,
        cityWindSpeed: wSpeedinfo.windSpeed,
      );
    } else {
      return WeatherData(
        cityName: 'NO SUCH CITY FOUND',
        citytemp: 00.00,
        cityWeatherDiscription: "NO SUCH CITY FOUND",
        cityWindSpeed: 0.00,
      );
    }
  }
}
