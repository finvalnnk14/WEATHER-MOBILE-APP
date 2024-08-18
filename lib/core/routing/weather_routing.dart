// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:opweather/core/core.dart';
import 'package:opweather/features/features.dart';

class WeatherRouting {
  static final routes = [
    GetPage(
      name: AppConstants.weatherRoute,
      page: () => const WeatherScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WeatherController>(() => WeatherController());
      }),
    ),
    GetPage(
      name: AppConstants.weatherSearchRoute,
      page: () => const WeatherSearchScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WeatherSearchController>(() => WeatherSearchController());
      }),
    )
  ];
}
