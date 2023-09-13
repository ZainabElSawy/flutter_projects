import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => GetWeatherCubit(WeatherService(Dio())),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<GetWeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel!
                    .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomeView(),
    );
  }
}
