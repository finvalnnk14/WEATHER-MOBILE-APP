// Project imports:
import 'package:opweather/features/features.dart';

class WeatherResponseEntity {
  final String timestamp;
  final List<WeatherEntity> area;

  WeatherResponseEntity({
    required this.timestamp,
    required this.area,
  });
}
