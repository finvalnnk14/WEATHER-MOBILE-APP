// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:opweather/features/features.dart';

class InitialBindingHelper extends Bindings {
  @override
  void dependencies() {
    // Features - App Startup
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);

    // Features - Weather
    Get.lazyPut<WeatherController>(() => WeatherController(), fenix: true);
    Get.lazyPut<WeatherLocalDataSource>(() => WeatherLocalDataSource(),
        fenix: true);
    Get.lazyPut<WeatherRemoteDataSource>(() => WeatherRemoteDataSource(),
        fenix: true);
    Get.lazyPut<WeatherRepositoryImpl>(
        () => WeatherRepositoryImpl(Get.find<WeatherLocalDataSource>(),
            Get.find<WeatherRemoteDataSource>()),
        fenix: true);
    Get.lazyPut<WeatherUsecase>(
        () => WeatherUsecase(Get.find<WeatherRepositoryImpl>()),
        fenix: true);
  }
}
