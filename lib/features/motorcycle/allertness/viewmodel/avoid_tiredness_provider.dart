import 'package:flutter/material.dart';
import '../model/avoid_tiredness_model.dart';
import '../repo/avoid_tiredness_repo.dart';

class AvoidingTirednessProvider extends ChangeNotifier {
  final AvoidingTirednessRepository _repository = AvoidingTirednessRepository();

  AvoidingTirednessModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  AvoidingTirednessModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAvoidingTirednessData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchAvoidingTirednessData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
