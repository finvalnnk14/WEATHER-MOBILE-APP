// Project imports:
import 'package:opweather/features/features.dart';

class ParameterModel extends ParameterEntity {
  ParameterModel({
    required super.description,
    required super.timeranges,
  });

  factory ParameterModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> timerangeList = json['timerange'] ?? [];
    List<TimerangeModel> parsedTimerangeList =
        timerangeList.map((e) => TimerangeModel.fromJson(e)).toList();

    return ParameterModel(
      description: json['description'],
      timeranges: parsedTimerangeList,
    );
  }
}
