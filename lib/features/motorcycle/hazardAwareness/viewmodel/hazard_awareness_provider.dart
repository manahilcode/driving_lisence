import 'package:flutter/foundation.dart';

import '../model/hazard_awareness_model.dart';
import '../repo/hazard_awareness_repo.dart';

class HazardAwarenessProvider extends ChangeNotifier {
  final MotorCycleHazardAwarenessRepository repository;
  List<MotorcycleHazardAwareness> _hazards = [];
  bool _isLoading = false;

  HazardAwarenessProvider(this.repository);

  List<MotorcycleHazardAwareness> get hazards => _hazards;
  bool get isLoading => _isLoading;

  Future<void> loadHazards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _hazards = await repository.fetchHazards();
    } catch (e) {
      _hazards = [];
      debugPrint('Error loading hazards: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
