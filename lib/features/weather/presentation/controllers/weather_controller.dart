// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

// Project imports:
import 'package:opweather/core/core.dart';
import 'package:opweather/features/features.dart';

class WeatherController extends GetxController {
  final weatherUsecase = Get.find<WeatherUsecase>();

  RxString lastUpdate = ''.obs;
  RxString provinceName = ''.obs;
  RxString regionName = ''.obs;
  RxList<WeatherEntity> weather = <WeatherEntity>[].obs;
  RxList<ParameterEntity> humidities = <ParameterEntity>[].obs;
  RxList<ParameterEntity> maxHumidities = <ParameterEntity>[].obs;
  RxList<ParameterEntity> minHumidities = <ParameterEntity>[].obs;
  RxList<ParameterEntity> maxTemperatures = <ParameterEntity>[].obs;
  RxList<ParameterEntity> minTemperatures = <ParameterEntity>[].obs;
  RxList<ParameterEntity> temperatures = <ParameterEntity>[].obs;
  RxList<ParameterEntity> weathers = <ParameterEntity>[].obs;
  RxList<ParameterEntity> windDirections = <ParameterEntity>[].obs;
  RxList<ParameterEntity> windSpeeds = <ParameterEntity>[].obs;

  RxInt index = 0.obs;

  Future<void> getFirstTimeWeather() async {
    try {
      EasyLoading.show(status: 'Sedang memuat data...');

      final province = await weatherUsecase.getWeatherProvinceName();
      final region = await weatherUsecase.getWeatherRegion();

      final result = await weatherUsecase.getWeather(province);

      final filterData =
          result.area.where((element) => element.description == region);

      final humidityData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Humidity')
          .toList();

      final maxHumidityData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Max humidity')
          .toList();

      final minHumidityData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Min humidity')
          .toList();

      final maxTemperatureData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Max temperature')
          .toList();

      final minTemperatureData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Min temperature')
          .toList();

      final temperatureData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Temperature')
          .toList();

      final weatherData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Weather')
          .toList();

      final windDirectionData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Wind direction')
          .toList();

      final windSpeedData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Wind speed')
          .toList();

      lastUpdate.value = result.timestamp;
      provinceName.value = province;
      regionName.value = region;
      weather.value = result.area;
      humidities.value = humidityData;
      maxHumidities.value = maxHumidityData;
      minHumidities.value = minHumidityData;
      maxTemperatures.value = maxTemperatureData;
      minTemperatures.value = minTemperatureData;
      temperatures.value = temperatureData;
      weathers.value = weatherData;
      windDirections.value = windDirectionData;
      windSpeeds.value = windSpeedData;

      Get.offAllNamed(AppConstants.weatherRoute);
    } catch (e) {
      if (e is DioException) {
        toastification.dismissAll();

        toastification.show(
          context: Get.context!,
          type: ToastificationType.error,
          style: ToastificationStyle.flatColored,
          icon: const Icon(Icons.error, color: Color(0xFFFF3A30)),
          title: const Text(
            AppConstants.titleError,
            style: TextStyle(
              color: Color(0xFFFF3A30),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          description: const Text(
            AppConstants.messageErrorServer,
            style: TextStyle(
              color: Color(0xFFFF3A30),
              fontSize: 12.0,
            ),
          ),
          margin: EdgeInsets.zero,
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 4),
          animationBuilder: (
            context,
            animation,
            alignment,
            child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          borderRadius: BorderRadius.circular(12.0),
          closeButtonShowType: CloseButtonShowType.none,
          showProgressBar: false,
        );
      } else {
        toastification.dismissAll();

        toastification.show(
          context: Get.context!,
          type: ToastificationType.error,
          style: ToastificationStyle.flatColored,
          icon: const Icon(Icons.error, color: Color(0xFFFF3A30)),
          title: const Text(
            AppConstants.titleError,
            style: TextStyle(
              color: Color(0xFFFF3A30),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          description: const Text(
            AppConstants.messageErrorSystem,
            style: TextStyle(
              color: Color(0xFFFF3A30),
              fontSize: 12.0,
            ),
          ),
          margin: EdgeInsets.zero,
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 4),
          animationBuilder: (
            context,
            animation,
            alignment,
            child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          borderRadius: BorderRadius.circular(12.0),
          closeButtonShowType: CloseButtonShowType.none,
          showProgressBar: false,
        );
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getWeather() async {
    try {
      EasyLoading.show(status: 'Sedang memuat data...');

      final province = await weatherUsecase.getWeatherProvinceName();
      final region = await weatherUsecase.getWeatherRegion();

      final result = await weatherUsecase.getWeather(province);

      final filterData =
          result.area.where((element) => element.description == region);

      final humidityData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Humidity')
          .toList();

      final maxHumidityData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Max humidity')
          .toList();

      final minHumidityData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Min humidity')
          .toList();

      final maxTemperatureData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Max temperature')
          .toList();

      final minTemperatureData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Min temperature')
          .toList();

      final temperatureData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Temperature')
          .toList();

      final weatherData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Weather')
          .toList();

      final windDirectionData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Wind direction')
          .toList();

      final windSpeedData = filterData
          .expand((element) => element.parameters)
          .where((parameter) => parameter.description == 'Wind speed')
          .toList();

      lastUpdate.value = result.timestamp;
      provinceName.value = province;
      regionName.value = region;
      weather.value = result.area;
      humidities.value = humidityData;
      maxHumidities.value = maxHumidityData;
      minHumidities.value = minHumidityData;
      maxTemperatures.value = maxTemperatureData;
      minTemperatures.value = minTemperatureData;
      temperatures.value = temperatureData;
      weathers.value = weatherData;
      windDirections.value = windDirectionData;
      windSpeeds.value = windSpeedData;
    } catch (e) {
      if (e is DioException) {
        toastification.dismissAll();

        toastification.show(
          context: Get.context!,
          type: ToastificationType.error,
          style: ToastificationStyle.flatColored,
          icon: const Icon(Icons.error, color: Color(0xFFFF3A30)),
          title: const Text(
            AppConstants.titleError,
            style: TextStyle(
              color: Color(0xFFFF3A30),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          description: const Text(
            AppConstants.messageErrorServer,
            style: TextStyle(
              color: Color(0xFFFF3A30),
              fontSize: 12.0,
            ),
          ),
          margin: EdgeInsets.zero,
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 4),
          animationBuilder: (
            context,
            animation,
            alignment,
            child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          borderRadius: BorderRadius.circular(12.0),
          closeButtonShowType: CloseButtonShowType.none,
          showProgressBar: false,
        );
      } else {
        toastification.dismissAll();

        toastification.show(
          context: Get.context!,
          type: ToastificationType.error,
          style: ToastificationStyle.flatColored,
          icon: const Icon(Icons.error, color: Color(0xFFFF3A30)),
          title: const Text(
            AppConstants.titleError,
            style: TextStyle(
              color: Color(0xFFFF3A30),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          description: const Text(
            AppConstants.messageErrorSystem,
            style: TextStyle(
              color: Color(0xFFFF3A30),
              fontSize: 12.0,
            ),
          ),
          margin: EdgeInsets.zero,
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 4),
          animationBuilder: (
            context,
            animation,
            alignment,
            child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          borderRadius: BorderRadius.circular(12.0),
          closeButtonShowType: CloseButtonShowType.none,
          showProgressBar: false,
        );
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> handleSelectWeather(int index) async {
    this.index.value = index;
  }

  Future<void> navigateToSearchWeather() async {
    await Get.toNamed(AppConstants.weatherSearchRoute);

    await getWeather();
  }
}
