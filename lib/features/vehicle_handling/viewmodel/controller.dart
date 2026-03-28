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

  KeepControlVehicleModel? _controlVehicleModel;
  KeepControlVehicleModel? get controlVehicleModel => _controlVehicleModel;

  TrafficCalmingAndRoadSurfaces? _calmingAndRoadSurfaces;
  TrafficCalmingAndRoadSurfaces? get calmingAndRoadSurface => _calmingAndRoadSurfaces;

  MeetingStandard? _meetingStandard;
  MeetingStandard? get meetingStandard => _meetingStandard;

  ThinkAbout? _thinkAbout;
  ThinkAbout? get thinkAbout => _thinkAbout;

  PracticeWithInstructor? _practiceWithInstructor;
  PracticeWithInstructor? get practiceWithInstructor=>_practiceWithInstructor;



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

  Future<void> getKeepControlVehicle() async
  {
    final data = await _repository.fetchKeepControlVehicle();
    if(data != null)
    {
      _controlVehicleModel = data;
      notifyListeners();
    }
  }
  Future<void> getTrafficClaimRoadSurface() async
  {
    final data = await _repository.getTrafficCalmingData();
    if(data != null)
    {
      _calmingAndRoadSurfaces = data;
      notifyListeners();
    }
  }


  Future<void> getMeetingWithStandard() async
  {
    final data = await _repository.getMeetingStandardData();
    if(data != null)
    {
      _meetingStandard = data;
      notifyListeners();
    }
  }

  Future<void> getThinkAbout() async
  {
    final data = await _repository.getThinkAboutData();
    if(data != null)
    {
      _thinkAbout = data;
      notifyListeners();
    }
  }

  Future<void> getPracticeWithInstructor() async
  {
    final data = await _repository.getPracticeWithInstructorData();
    if(data != null)
    {
      _practiceWithInstructor = data;
      print(_practiceWithInstructor);
      notifyListeners();
    }
  }

}
