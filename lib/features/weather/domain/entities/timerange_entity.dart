// Project imports:
import 'package:opweather/features/features.dart';

class TimerangeEntity {
  final String type;
  final String datetime;
  final List<TimerangeValueEntity> timerange;

  TimerangeEntity({
    required this.type,
    required this.datetime,
    required this.timerange,
  });
}
