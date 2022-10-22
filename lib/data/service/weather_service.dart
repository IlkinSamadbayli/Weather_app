import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_blc/constants/api_constant.dart';
import 'package:weather_blc/data/models/weather_fetch_model.dart';

class WeatherService {
  Future<dynamic> fetchWeatherInfo(String cityName) async {
    Uri url =
        Uri.parse("${ApiConstants.apiUrl}$cityName${ApiConstants.apiKey}");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return WeatherFetchModel.fromJson(result);
    } else {
      throw Exception();
    }
  }
}
