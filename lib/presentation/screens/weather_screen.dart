import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/additional_info_item.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    (context).read<WeatherBloc>().add(WeatherFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, weatherState) {
            if (weatherState is WeatherFailure) {
              return Center(
                child: Text(weatherState.error),
              );
            } else if (weatherState is! WeatherSuccess) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // main card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  '${(weatherState).weatherList[0].currentTemp} K',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Icon(
                                  ((weatherState).weatherList[0].currentSky) ==
                                              'Clouds' ||
                                          ((weatherState)
                                                  .weatherList[0]
                                                  .currentSky) ==
                                              'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 64,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  ((weatherState).weatherList[0].currentSky),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Hourly Forecast',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // SizedBox(
                  //   height: 120,
                  //   child: ListView.builder(
                  //     itemCount: 5,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       // final hourlyForecast = data['list'][index + 1];
                  //       final hourlyForecast = weatherState.weatherList[index+1];

                  //       final hourlySky =
                  //           weatherState.weatherList[index + 1].currentSky;
                  //       final hourlyTemp =
                  //           weatherState.weatherList[index + 1].currentTemp.toString();
                  //       final time = DateTime.parse(hourlyForecast['dt_txt']);
                  //       return HourlyForecastItem(
                  //         time: DateFormat.j().format(time),
                  //         temperature: hourlyTemp,
                  //         icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                  //             ? Icons.cloud
                  //             : Icons.sunny,
                  //       );
                  //     },
                  //   ),
                  // ),

                  const SizedBox(height: 20),
                  const Text(
                    'Additional Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfoItem(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: weatherState.weatherList[0].currentHumidity
                            .toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.air,
                        label: 'Wind Speed',
                        value: weatherState.weatherList[0].currentWindSpeed
                            .toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.beach_access,
                        label: 'Pressure',
                        value: weatherState.weatherList[0].currentPressure
                            .toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
