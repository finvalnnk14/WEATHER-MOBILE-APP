// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:opweather/core/core.dart';
import 'package:opweather/features/features.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final weatherController = Get.find<WeatherController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Cuaca',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                  Text(
                                    weatherController.regionName.value,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(64, 138, 222, 1),
                              ),
                              onPressed:
                                  weatherController.navigateToSearchWeather,
                              child: const Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Ubah Lokasi',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/weather/${weatherController.weathers.first.timeranges[weatherController.index.value].timerange.first.text}.svg',
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                const SizedBox(width: 20.0),
                                SizedBox(
                                  width: 1.0,
                                  height: 100.0,
                                  child: Container(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        '${weatherController.temperatures.first.timeranges[weatherController.index.value].timerange.first.text}°C',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 50.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        GenerateWeatherNameHelper
                                            .getWeatherDescription(
                                          int.parse(weatherController
                                              .weathers
                                              .first
                                              .timeranges[
                                                  weatherController.index.value]
                                              .timerange
                                              .first
                                              .text),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 14.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 60.0,
                                      width: 60.0,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            233, 236, 241, 1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Image.asset(
                                          "assets/images/windspeed.png"),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      '${weatherController.windSpeeds.first.timeranges[weatherController.index.value].timerange.first.text} ${weatherController.windSpeeds.first.timeranges[weatherController.index.value].timerange.last.unit}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 60.0,
                                      width: 60.0,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            233, 236, 241, 1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Image.asset(
                                          "assets/images/humidity.png"),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      '${weatherController.humidities.first.timeranges[weatherController.index.value].timerange.first.text} ${weatherController.humidities.first.timeranges[weatherController.index.value].timerange.first.unit}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Prakiraan Cuaca',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(
                        () => Container(
                          height: 200.0,
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: ListView.builder(
                            itemCount: weatherController
                                .weathers.first.timeranges.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final weather = weatherController
                                  .weathers.first.timeranges[index];

                              final temperature = weatherController
                                  .temperatures.first.timeranges[index];

                              return Obx(
                                () => GestureDetector(
                                  onTap: () => weatherController
                                      .handleSelectWeather(index),
                                  child: Container(
                                    width: 120.0,
                                    // padding: const EdgeInsets.all(10.0),
                                    margin: EdgeInsets.only(
                                      left: index == 0 ? 0.0 : 20.0,
                                      right: 5.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0.5, 0),
                                          blurRadius: 30,
                                          spreadRadius: 1,
                                          color: const Color(0xFFE4E4EE)
                                              .withAlpha(150),
                                        )
                                      ],
                                      gradient: weatherController.index.value ==
                                              index
                                          ? const LinearGradient(colors: [
                                              Color.fromRGBO(64, 138, 222, 1),
                                              Color.fromRGBO(82, 134, 205, 1)
                                            ])
                                          : null,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 10.0,
                                              ),
                                              child: Text(
                                                FormatDateHelper
                                                    .formatTimestampTime(
                                                        weather.datetime),
                                                style: TextStyle(
                                                  color: weatherController
                                                              .index.value ==
                                                          index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 14.0,
                                                  fontWeight: weatherController
                                                              .index.value ==
                                                          index
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/weather/${weather.timerange.first.text}.svg',
                                              width: 40.0,
                                              height: 40.0,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                bottom: 10.0,
                                              ),
                                              child: Text(
                                                "${temperature.timerange.first.text}°C",
                                                style: TextStyle(
                                                  color: weatherController
                                                              .index.value ==
                                                          index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 14.0,
                                                  fontWeight: weatherController
                                                              .index.value ==
                                                          index
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Kelembaban',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Obx(
                        () => SizedBox(
                          height: 180,
                          child: Column(
                            children: [
                              Center(
                                child: SleekCircularSlider(
                                  min: 0,
                                  max: 100,
                                  initialValue: double.parse(weatherController
                                      .humidities
                                      .first
                                      .timeranges[weatherController.index.value]
                                      .timerange
                                      .first
                                      .text),
                                  appearance: CircularSliderAppearance(
                                    customWidths: CustomSliderWidths(
                                        handlerSize: 0,
                                        trackWidth: 12,
                                        progressBarWidth: 12),
                                    infoProperties: InfoProperties(
                                      bottomLabelText: "Humidity",
                                      bottomLabelStyle: const TextStyle(
                                        letterSpacing: 0.1,
                                        fontSize: 14,
                                        height: 1.5,
                                      ),
                                    ),
                                    animationEnabled: true,
                                    size: 140,
                                    customColors: CustomSliderColors(
                                        hideShadow: true,
                                        trackColor: const Color.fromARGB(
                                                255, 64, 138, 222)
                                            .withAlpha(100),
                                        progressBarColors: [
                                          const Color.fromRGBO(64, 138, 222, 1),
                                          const Color.fromRGBO(82, 134, 205, 1)
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Terakhir diperbarui: ${FormatDateHelper.formatTimestampDateTime(weatherController.lastUpdate.value)}',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
