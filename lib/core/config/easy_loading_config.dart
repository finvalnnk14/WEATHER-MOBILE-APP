// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingConfig {
  static void init() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskType = EasyLoadingMaskType.black;
  }
}
