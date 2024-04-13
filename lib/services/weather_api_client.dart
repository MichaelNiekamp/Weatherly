import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:rain/model/weather_model.dart';

final KEY = dotenv.env['APIKEY'];

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? Location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$Location&appid=$KEY&units=imperial");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
