// Project imports:
import 'package:opweather/features/features.dart';
import 'package:opweather/features/weather/data/models/weather_response_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherLocalDataSource weatherLocalDataSource;
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImpl(
      this.weatherLocalDataSource, this.weatherRemoteDataSource);

  @override
  Future<String> getWeatherProvinceName() async {
    return await weatherLocalDataSource.getWeatherProvinceName();
  }

  @override
  Future<void> setWeatherProvinceName(String provinceName) async {
    return await weatherLocalDataSource.setWeatherProvinceName(provinceName);
  }

  @override
  Future<String> getWeatherRegion() async {
    return await weatherLocalDataSource.getWeatherRegion();
  }

  @override
  Future<void> setWeatherRegion(String region) async {
    return await weatherLocalDataSource.setWeatherRegion(region);
  }

  @override
  Future<WeatherProvinceResponseModel> getWeatherProvince() async {
    return await weatherRemoteDataSource.getWeatherProvince();
  }

  @override
  Future<WeatherResponseModel> getWeather(String province) async {
    return await weatherRemoteDataSource.getWeather(province);
  }
}
