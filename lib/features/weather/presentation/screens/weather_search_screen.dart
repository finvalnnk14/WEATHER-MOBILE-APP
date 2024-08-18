// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:opweather/features/features.dart';

class WeatherSearchScreen extends StatefulWidget {
  const WeatherSearchScreen({super.key});

  @override
  State<WeatherSearchScreen> createState() => _WeatherSearchScreenState();
}

class _WeatherSearchScreenState extends State<WeatherSearchScreen> {
  final weatherSearchController = Get.find<WeatherSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Lokasi'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (weatherSearchController.isLoading.value) {
            return const SizedBox();
          } else {
            if (weatherSearchController.selectedProvince.isEmpty) {
              return ListView.builder(
                  itemCount: weatherSearchController.weatherProvince.length,
                  itemBuilder: (context, index) {
                    final province =
                        weatherSearchController.weatherProvince[index];

                    return ListTile(
                      title: Text(province.name),
                      onTap: () => weatherSearchController
                          .handleSelectProvince(province.id),
                    );
                  });
            } else if (weatherSearchController.selectedProvince.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: ListView.builder(
                    itemCount: weatherSearchController.weatherRegion.length,
                    itemBuilder: (context, index) {
                      final region =
                          weatherSearchController.weatherRegion[index];

                      return ListTile(
                        title: Text(region.description),
                        onTap: () => weatherSearchController
                            .handleSelectRegion(region.description),
                        selected: weatherSearchController.selectedRegion.value
                            .contains(region.description),
                        selectedColor: const Color.fromARGB(255, 255, 255, 255),
                        selectedTileColor:
                            const Color.fromARGB(255, 83, 132, 197),
                      );
                    }),
              );
            } else {
              return const SizedBox();
            }
          }
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() {
        if (weatherSearchController.selectedProvince.isNotEmpty &&
            weatherSearchController.selectedRegion.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48.0,
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 83, 132, 197),
                onPressed: weatherSearchController.handleConfirmation,
                child: const Text(
                  'Simpan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
