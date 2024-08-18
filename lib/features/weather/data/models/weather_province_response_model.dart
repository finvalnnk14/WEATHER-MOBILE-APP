// Project imports:
import 'package:opweather/features/features.dart';

class WeatherProvinceResponseModel extends WeatherProvinceResponseEntity {
  WeatherProvinceResponseModel({
    required super.provinces,
  });

  factory WeatherProvinceResponseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> provinceList = json['data'] ?? [];
    List<WeatherProvinceModel> parsedProvinceList =
        provinceList.map((e) => WeatherProvinceModel.fromJson(e)).toList();

    return WeatherProvinceResponseModel(
      provinces: parsedProvinceList,
    );
  }
}
