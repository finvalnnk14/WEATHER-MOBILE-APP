// Project imports:
import 'package:opweather/features/features.dart';
import 'package:opweather/features/weather/data/models/weather_response_model.dart';

abstract class WeatherRepository {
  Future<String> getWeatherProvinceName();
  Future<void> setWeatherProvinceName(String provinceName);
  Future<String> getWeatherRegion();
  Future<void> setWeatherRegion(String region);
  Future<WeatherProvinceResponseModel> getWeatherProvince();
  Future<WeatherResponseModel> getWeather(String province);
}
