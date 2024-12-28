import 'package:flutter/foundation.dart';

import '../../hazard/repo/hazard_repo.dart';
import '../model/hazard_awareness1.dart';
import '../repo/hazard_awareness1_repo.dart';

class MotorcycleHazardProviderAwareness extends ChangeNotifier {
  final MotorcycleHazardawarenessRepository repository;
  MotorcycleMotorcycleHazard? _hazards;
  bool _isLoading = false;

  MotorcycleHazardProviderAwareness(this.repository);

  MotorcycleMotorcycleHazard get hazards => _hazards!;
  bool get isLoading => _isLoading;

  Future<void> loadMotorcycleHazards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _hazards = await repository.fetchMotorcycleHazards();
    } catch (e) {
      _hazards = _hazards;
      debugPrint('Error loading motorcycle hazards: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
