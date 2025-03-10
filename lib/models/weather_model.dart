// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final int currentPressure;
  final double currentWindSpeed;
  final int currentHumidity;
  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    int? currentPressure,
    double? currentWindSpeed,
    int? currentHumidity,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> data) {
    final currentWeatherData = data;

    return WeatherModel(
      currentTemp: currentWeatherData['main']['temp'],
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemp == currentTemp &&
        other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity;
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^
        currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode;
  }
}

// class WeatherList {
//   List<WeatherModel> weahterList;
//   WeatherList({
//     required this.weahterList,
//   });

//   WeatherList copyWith({
//     List<WeatherModel>? weahterList,
//   }) {
//     return WeatherList(
//       weahterList: weahterList ?? this.weahterList,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'weahterList': weahterList.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory WeatherList.fromMap(Map<String, dynamic> map) {
    
//     return WeatherList(
//       weahterList: List<WeatherModel>.from(
//         (map['weahterList'] as List<int>).map<WeatherModel>(
//           (x) => WeatherModel.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory WeatherList.fromJson(String source) =>
//       WeatherList.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'WeatherList(weahterList: $weahterList)';

//   @override
//   bool operator ==(covariant WeatherList other) {
//     if (identical(this, other)) return true;

//     return listEquals(other.weahterList, weahterList);
//   }

//   @override
//   int get hashCode => weahterList.hashCode;
// }
