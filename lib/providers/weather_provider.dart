import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

enum WeatherStatus { initial, loading, loaded, error }

class WeatherProvider extends ChangeNotifier {
  final WeatherService _service = WeatherService();

  WeatherStatus _status = WeatherStatus.initial;
  WeatherModel? _weather;
  String _errorMessage = '';

  WeatherStatus get status => _status;
  WeatherModel? get weather => _weather;
  String get errorMessage => _errorMessage;

  Future<void> fetchWeather(String city) async {
    _status = WeatherStatus.loading;
    notifyListeners();

    try {
      _weather = await _service.fetchByCity(city);
      _status = WeatherStatus.loaded;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _status = WeatherStatus.error;
    }

    notifyListeners();
  }

  void reset() {
    _status = WeatherStatus.initial;
    _weather = null;
    notifyListeners();
  }
}
