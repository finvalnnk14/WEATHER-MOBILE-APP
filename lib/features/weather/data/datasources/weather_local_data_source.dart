// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class WeatherLocalDataSource {
  static const String _keyProvinceName = 'provinceName';
  static const String _keyRegion = 'region';

  Future<String> getWeatherProvinceName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_keyProvinceName) ?? 'DKIJakarta';
  }

  Future<void> setWeatherProvinceName(String provinceName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(_keyProvinceName, provinceName);
  }

  Future<String> getWeatherRegion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_keyRegion) ?? 'Jakarta Pusat';
  }

  Future<void> setWeatherRegion(String region) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(_keyRegion, region);
  }
}
