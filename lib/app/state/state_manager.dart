
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:open_weather/app/model/weather_model.dart';
import 'package:open_weather/app/services/services.dart';

String name;

final cityDetailsStateFuture = FutureProvider<CityModel>((ref) async {
  return fetchCityDetails();
});


// final weatherDetailsStateFuture = FutureProvider<WeatherModel>((ref) async {
//   return fetchWeatherDetails();
// });
