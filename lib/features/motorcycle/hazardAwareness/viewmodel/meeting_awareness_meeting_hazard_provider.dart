import 'package:flutter/foundation.dart';

import '../model/meeting_with_Standard.dart';
import '../repo/meeting_awareness_hazard_repo.dart';

class HazardAwarenessMeetingStandardProvider extends ChangeNotifier {
  final HazardAwarenessMeetingStandardRepository repository;
  List<HazardAwarenessMeetingStandard> _standards = [];
  bool _isLoading = false;

  HazardAwarenessMeetingStandardProvider(this.repository);

  List<HazardAwarenessMeetingStandard> get standards => _standards;
  bool get isLoading => _isLoading;

  Future<void> loadHazardAwarenessMeetingStandard() async {
    _isLoading = true;
    notifyListeners();

    try {
      _standards = await repository.fetchHazardAwarenessMeetingStandard();
    } catch (e) {
      _standards = [];
      debugPrint('Error loading hazard awareness meeting standard: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
