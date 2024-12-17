import 'package:flutter/foundation.dart';
import '../model/road_weather_condition.dart';
import '../repo/road_weather_condition_repo.dart';

class MotorcycleRoadWeatherConditionsProvider with ChangeNotifier {
  final MotorcycleRoadWeatherConditionsRepository _repository =
  MotorcycleRoadWeatherConditionsRepository();

  // State to store the fetched road weather conditions
  MotorcycleRoadWeatherConditions? _roadWeatherConditions;

  // Getter for the road weather conditions
  MotorcycleRoadWeatherConditions? get roadWeatherConditions =>
      _roadWeatherConditions;

  // Method to fetch road weather conditions from the repository
  Future<void> fetchRoadWeatherConditions(
      String collectionName, String docName) async {
    try {
      _roadWeatherConditions =
      await _repository.fetchRoadWeatherConditions(collectionName, docName);
      notifyListeners(); // Notify listeners when the data is fetched
    } catch (e) {
      print('Error in provider while fetching road weather conditions: $e');
    }
  }
}
