import 'package:flutter/foundation.dart';

import '../model/moving_hazard.dart';
import '../repo/moving_hazard_repo.dart';

class MovingHazardsProvider extends ChangeNotifier {
  final MovingHazardsRepository repository;
   MovingHazards? _items;
  bool _isLoading = false;

  MovingHazardsProvider(this.repository);

  MovingHazards? get items => _items!;
  bool get isLoading => _isLoading;

  Future<void> loadMovingHazards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _items = await repository.fetchMovingHazards();
    } catch (e) {
      _items = _items;
      debugPrint('Error loading moving hazards: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
