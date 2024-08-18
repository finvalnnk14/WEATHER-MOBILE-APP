// Project imports:
import 'package:opweather/features/features.dart';

class TimerangeModel extends TimerangeEntity {
  TimerangeModel({
    required super.type,
    required super.datetime,
    required super.timerange,
  });

  factory TimerangeModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> timrangeValueList = json['value'] ?? [];
    List<TimerangeValueModel> parsedTimrangeValueList =
        timrangeValueList.map((e) => TimerangeValueModel.fromJson(e)).toList();

    return TimerangeModel(
      type: json['type'],
      datetime: json['datetime'],
      timerange: parsedTimrangeValueList,
    );
  }
}
