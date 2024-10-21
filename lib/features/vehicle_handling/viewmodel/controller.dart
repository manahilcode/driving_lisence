import 'package:driving_lisence/features/vehicle_handling/model/model.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';
import '../model/model.dart';
import '../repo/repo.dart';

class IntroductionController with ChangeNotifier {
  final Repository _repository = Repository();
  IntroductionModel? _introductionModel;
  bool _isLoading = false;

  IntroductionModel? get introductionModel => _introductionModel;
  bool get isLoading => _isLoading;

  WeatherCondition? _weatherCondition;

  WeatherCondition? get weatherCondition => _weatherCondition;

  List<WeatherCondition> questions = [];

  List<FogModel> _fogModels = [];
  List<FogModel> get fogModels => _fogModels;


  VeryBadWeatherModel? _badWeatherModel;
  VeryBadWeatherModel? get badWeatherModel => _badWeatherModel;

  WindyModel?  _windyModel;
  WindyModel? get windyModel => _windyModel;

  DrivingNightModel? _drivingNightModel;

  DrivingNightModel? get drivingNoghtModel => _drivingNightModel;



  Future<void> fetchImageData() async {
    _isLoading = true;
    notifyListeners();
    try {
      _introductionModel = await _repository.fetchImageData();
      notifyListeners();
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getWeatherCondition() async {
    final data = await _repository.fetchWeatherCondition();
    if (data != null) {
      print(data.title);
      _weatherCondition = data;
      notifyListeners();
    }
  }

  Future<void>? getFogData() async {
    final data = await _repository.fetchFogData();
    if (data != null) {
      _fogModels = [data];
      notifyListeners();
      print("Fog Data : $data");

    }
  }

  Future<void>  getVeryBadWeather() async {
    final data = await _repository.fetchVeryBadWeather();
    if(data != null)
      {
        _badWeatherModel = data;
        notifyListeners();
      }
  }

  Future<void> getWindyWeather() async
  {
    final data = await _repository.fetchWindyWeather();
    if(data != null)
      {
        _windyModel = data;
        notifyListeners();
      }
  }


  Future<void> getDrivingNight() async
  {
    final data = await _repository.fetchDriveNight();
    if(data != null)
    {
      _drivingNightModel = data;
      notifyListeners();
    }
  }

}
