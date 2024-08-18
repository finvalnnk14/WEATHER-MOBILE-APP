// Project imports:
import 'package:opweather/features/features.dart';

class WeatherEntity {
  final String description;
  final List<ParameterEntity> parameters;

  WeatherEntity({
    required this.description,
    required this.parameters,
  });
}
