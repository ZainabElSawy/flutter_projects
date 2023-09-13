import 'package:flutter/material.dart';

import 'package:weather_app/models/weather_model.dart';

// ignore: must_be_immutable
class WeatherInfoBody extends StatelessWidget {
  WeatherModel? weatherModel;
  WeatherInfoBody({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            weatherModel!.getThemeColor(),
            weatherModel!.getThemeColor()[300]!,
            weatherModel!.getThemeColor()[100]!,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${weatherModel!.cityName}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
            'Updated at ${weatherModel!.date?.split(' ')[1]}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherModel!.getImage()),
              Text(
                '${weatherModel!.temp}°C',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Max: ${weatherModel!.maxTemp}°C',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'Min: ${weatherModel!.minTemp}°C',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 50),
          Text(
            "${weatherModel!.weatherCondition}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          )
        ],
      ),
    );
  }
}
