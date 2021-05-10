import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/app/model/weather_model.dart';
import 'package:open_weather/app/ui/screen/view_details_screen.dart';
import 'package:open_weather/app/util/api/util_api.dart';


Future<CityModel> fetchCityDetails() async {
  http.Response response = await http.get(API_DETAILS_URL);
  if (response.statusCode != 200) return null;

  final items = jsonDecode(response.body);
  CityModel cityModel = CityModel.fromJson(json.decode(response.body));

  print('City Model:--> ${cityModel.list.elementAt(0).cityCode}');
  return CityModel.fromJson(items);
}


Future<WeatherModel> fetchWeatherDetails(String cityCode, BuildContext context) async {
  final response = await http.get
    ('https://api.openweathermap.org/data/2.5/weather?id='+ cityCode +'&appid=b523d1feed605d845b1e5f9967af91ad')
      .timeout(Duration(seconds: 60));

  if (response.statusCode != 200) return null;

  final items = jsonDecode(response.body);
  WeatherModel weatherModel = WeatherModel.fromJson(json.decode(response.body));

  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ViewDetailsPage(
            cityCode: WeatherModel.fromJson(items))
    ),
  );
  return WeatherModel.fromJson(items);
}

