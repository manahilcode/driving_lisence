import 'package:flutter/cupertino.dart';

import '../model/breakdown_model.dart';
import '../repo/breakdown_repo.dart';

class BreakdownPointsProvider with ChangeNotifier {
  final BreakdownPointsRepository _repository = BreakdownPointsRepository();

  BreakdownPointModel? _guidelines;
  bool _isLoading = true;

  BreakdownPointModel? get guidelines => _guidelines;
  bool get isLoading => _isLoading;

  BreakdownGuidelinesProvider() {
    fetchGuidelines();
  }

  void fetchGuidelines() async{
    _isLoading = true;
    notifyListeners();

    try {
      // Fetch the data
      _guidelines = await _repository.fetchBreakdownData();
    } catch (e) {
      print('Error fetching breakdown guidelines: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}