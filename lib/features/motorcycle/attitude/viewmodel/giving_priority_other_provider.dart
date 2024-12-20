import 'package:flutter/material.dart';

import '../model/giving_priority_other.dart';
import '../repo/giving_priority_other_repo.dart';

class GivingPriorityToOthersProvider extends ChangeNotifier {
  final GivingPriorityToOthersRepository _repository = GivingPriorityToOthersRepository();

  GivingPriorityToOthersModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  GivingPriorityToOthersModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchGivingPriorityToOthersData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchGivingPriorityToOthersData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
