// Project imports:
import 'package:opweather/features/features.dart';

class TimerangeValueModel extends TimerangeValueEntity {
  TimerangeValueModel({
    required super.unit,
    required super.text,
  });

  factory TimerangeValueModel.fromJson(Map<String, dynamic> json) {
    return TimerangeValueModel(
      unit: json['unit'],
      text: json['text'],
    );
  }
}
