// Provider Class
import 'package:flutter/cupertino.dart';
import '../model/additional_rules_for_motorways_model.dart';
import '../repo/additional_rules_for_motorways_repo.dart';

class MotorwayGuideProvider extends ChangeNotifier {
  final AdditionalRulesForMotorwaysRepository _repository;
  AdditionalRulesForMotorwaysModel? _motorwayGuide;
  bool _isLoading = false;
  String? _error;

  MotorwayGuideProvider(this._repository);

  AdditionalRulesForMotorwaysModel? get motorwayGuide => _motorwayGuide;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadMotorwayGuide(String documentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _motorwayGuide = await _repository.fetchMotorwayGuide(documentId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
