// Project imports:
import 'package:opweather/features/features.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.description,
    required super.parameters,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> parameterList = json['parameter'] ?? [];
    List<ParameterModel> parsedParameterList =
        parameterList.map((e) => ParameterModel.fromJson(e)).toList();

    return WeatherModel(
      description: json['description'],
      parameters: parsedParameterList,
    );
  }
}
