// Project imports:
import 'package:opweather/features/features.dart';

class WeatherResponseModel extends WeatherResponseEntity {
  WeatherResponseModel({
    required super.timestamp,
    required super.area,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> weatherList = json['area'] ?? [];
    List<WeatherModel> parsedWeatherList =
        weatherList.map((e) => WeatherModel.fromJson(e)).toList();

    return WeatherResponseModel(
      timestamp: json['timestamp'],
      area: parsedWeatherList,
    );
  }
}
