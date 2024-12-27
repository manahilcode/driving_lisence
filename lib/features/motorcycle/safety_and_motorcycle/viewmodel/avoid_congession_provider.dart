import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/avoiding_congession_model.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../repo/avoiding_congession_repo.dart';

class AvoidingCongestionNotifier extends ChangeNotifier {
  final AvoidingCongestionRepository _repository;
  AvoidingCongestionModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  AvoidingCongestionNotifier(this._repository);

  AvoidingCongestionModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
