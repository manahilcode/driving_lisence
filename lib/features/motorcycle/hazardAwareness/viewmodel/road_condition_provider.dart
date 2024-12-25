import 'package:flutter/foundation.dart';
import '../model/raod_condition.dart';
import '../repo/road_condition_hazard_Awareness.dart';

class RoadConditionProvider extends ChangeNotifier {
  final RoadConditionRepository repository;
  RoadConditionHazardAwareness? _items;
  bool _isLoading = false;

  RoadConditionProvider(this.repository);

  RoadConditionHazardAwareness get items => _items!;
  bool get isLoading => _isLoading;

  Future<void> loadRoadConditions() async {
    _isLoading = true;
    notifyListeners();

    try {
      _items = await repository.fetchRoadConditions();
    } catch (e) {
      _items = _items;
      debugPrint('Error loading road conditions: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
