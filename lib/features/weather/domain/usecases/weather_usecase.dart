// Project imports:
import 'package:opweather/features/features.dart';
import 'package:opweather/features/weather/data/models/weather_response_model.dart';

class WeatherUsecase {
  final WeatherRepository repository;

  WeatherUsecase(this.repository);

  Future<String> getWeatherProvinceName() async {
    return await repository.getWeatherProvinceName();
  }

  Future<void> setWeatherProvinceName(String name) async {
    return await repository.setWeatherProvinceName(name);
  }

  Future<String> getWeatherRegion() async {
    return await repository.getWeatherRegion();
  }

  Future<void> setWeatherRegion(String region) async {
    return await repository.setWeatherRegion(region);
  }

  Future<WeatherProvinceResponseEntity> getWeatherProvince() async {
    return await repository.getWeatherProvince();
  }

  Future<WeatherResponseModel> getWeather(String province) async {
    return await repository.getWeather(province);
  }
}
