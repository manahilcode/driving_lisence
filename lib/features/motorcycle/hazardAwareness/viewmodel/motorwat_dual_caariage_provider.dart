import 'package:flutter/foundation.dart';

import '../model/motorway_dual_carriageway.dart';
import '../repo/motorway_dual_carriageway_repo.dart';

class MotorwaysAndDualCarriagewaysProvider extends ChangeNotifier {
  final MotorwaysAndDualCarriagewaysRepository repository;
  List<MotorwaysAndDualCarriageways> _items = [];
  bool _isLoading = false;

  MotorwaysAndDualCarriagewaysProvider(this.repository);

  List<MotorwaysAndDualCarriageways> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> loadMotorwaysAndDualCarriageways() async {
    _isLoading = true;
    notifyListeners();

    try {
      _items = await repository.fetchMotorwaysAndDualCarriageways();
    } catch (e) {
      _items = [];
      debugPrint('Error loading motorways and dual carriageways: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}