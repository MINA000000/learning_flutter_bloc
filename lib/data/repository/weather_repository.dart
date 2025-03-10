import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  Future<List<WeatherModel>> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final res =
          await WeatherDataProvider().getCurrentWeather(cityName: cityName);

      final data = jsonDecode(res);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      // print(data['list'][0]['main']['pressure'].runtimeType);
      List<WeatherModel> ans = [];
      for(int i=0;i<5;i++)
      {
        ans.add(WeatherModel.fromMap(data['list'][i]));
      }
      return ans;
    } catch (e) {
      throw e.toString();
    }
  }
}
