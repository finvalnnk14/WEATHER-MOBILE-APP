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

class WeatherSearchController extends GetxController {
  final weatherUsecase = Get.find<WeatherUsecase>();

  RxBool isLoading = false.obs;
  RxString selectedProvince = ''.obs;
  RxString selectedRegion = ''.obs;
  RxList<WeatherProvinceEntity> weatherProvince = <WeatherProvinceEntity>[].obs;
  RxList<WeatherEntity> weatherRegion = <WeatherEntity>[].obs;

  @override
  void onInit() {
    super.onInit();

    getWeatherProvince();
  }

  Future<void> getWeatherProvince() async {
    try {
      isLoading.value = true;

      EasyLoading.show(status: 'Sedang memuat data...');

      final result = await weatherUsecase.getWeatherProvince();

      weatherProvince.value = result.provinces;
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
      isLoading.value = false;

      EasyLoading.dismiss();
    }
  }

  Future<void> handleSelectProvince(String province) async {
    try {
      EasyLoading.show(status: 'Sedang memuat data...');

      selectedProvince.value = province;

      final result = await weatherUsecase.getWeather(province);

      weatherRegion.value = result.area;
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

  Future<void> handleSelectRegion(String region) async {
    selectedRegion.value = region;
  }

  Future<void> handleConfirmation() async {
    try {
      weatherUsecase.setWeatherProvinceName(selectedProvince.value);
      weatherUsecase.setWeatherRegion(selectedRegion.value);

      Get.back();
    } catch (e) {
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
  }
}
