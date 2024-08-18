// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:opweather/features/features.dart';

class SplashController extends GetxController {
  final weatherController = Get.find<WeatherController>();

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(seconds: 3), () {
      getWeather();
    });
  }

  Future<void> getWeather() async {
    try {
      await weatherController.getFirstTimeWeather();
    } catch (e) {
      print(e);
    }
  }
}
