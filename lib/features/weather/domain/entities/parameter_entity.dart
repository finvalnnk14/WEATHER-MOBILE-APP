// Project imports:
import 'package:opweather/features/features.dart';

class ParameterEntity {
  final String description;
  final List<TimerangeEntity> timeranges;

  ParameterEntity({
    required this.description,
    required this.timeranges,
  });
}
