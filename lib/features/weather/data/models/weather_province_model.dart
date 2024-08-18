// Project imports:
import 'package:opweather/features/features.dart';

class WeatherProvinceModel extends WeatherProvinceEntity {
  WeatherProvinceModel({
    required super.id,
    required super.name,
  });

  factory WeatherProvinceModel.fromJson(Map<String, dynamic> json) {
    return WeatherProvinceModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
