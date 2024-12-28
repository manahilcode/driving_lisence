import 'package:flutter/foundation.dart';

import '../model/hazard_awareness_model.dart';
import '../repo/hazard_awareness_repo.dart';

class HazardAwarenessProvider11 extends ChangeNotifier {
  final MotorCycleHazardAwarenessRepository repository;
  MotorcycleHazardAwareness? _hazards;
  bool _isLoading = false;

  HazardAwarenessProvider11(this.repository);

  MotorcycleHazardAwareness get hazards => _hazards!;
  bool get isLoading => _isLoading;

  Future<void> loadHazards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _hazards = await repository.fetchHazards();
    } catch (e) {
      _hazards = _hazards;
      debugPrint('Error loading hazards: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
