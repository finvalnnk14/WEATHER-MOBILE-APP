// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Project imports:
import 'package:opweather/features/features.dart';
import 'package:opweather/features/weather/data/models/weather_response_model.dart';

class WeatherRemoteDataSource {
  static String apiUrl = dotenv.env['API_URL']!;
  static final dio = Dio();

  Future<WeatherProvinceResponseModel> getWeatherProvince() async {
    try {
      var response = await dio.get(
        '$apiUrl/provinces',
      );

      return WeatherProvinceResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherResponseModel> getWeather(String province) async {
    try {
      var response = await dio.get(
        '$apiUrl/weather/$province',
      );

      return WeatherResponseModel.fromJson(response.data['data']['forecast']);
    } catch (e) {
      rethrow;
    }
  }
}
