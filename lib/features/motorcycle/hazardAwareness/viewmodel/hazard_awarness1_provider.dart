import 'package:flutter/foundation.dart';

import '../../hazard/repo/hazard_repo.dart';
import '../model/hazard_awareness1.dart';
import '../repo/hazard_awareness1_repo.dart';

class MotorcycleHazardProvider extends ChangeNotifier {
  final MotorcycleHazardawarenessRepository repository;
  List<MotorcycleMotorcycleHazard> _hazards = [];
  bool _isLoading = false;

  MotorcycleHazardProvider(this.repository);

  List<MotorcycleMotorcycleHazard> get hazards => _hazards;
  bool get isLoading => _isLoading;

  Future<void> loadMotorcycleHazards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _hazards = await repository.fetchMotorcycleHazards();
    } catch (e) {
      _hazards = [];
      debugPrint('Error loading motorcycle hazards: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
