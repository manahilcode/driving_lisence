import 'package:flutter/material.dart';

import '../model/reviewing_driving_model.dart';
import '../repo/reviewing_driving_repo.dart';

class ReviewingYourDrivingProvider extends ChangeNotifier {
  final ReviewingYourDrivingRepository _repository = ReviewingYourDrivingRepository();
  ReviewingYourDriving? _reviewingYourDriving;
  bool _isLoading = false;
  String _errorMessage = '';

  ReviewingYourDriving? get reviewingYourDriving => _reviewingYourDriving;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Method to fetch ReviewingYourDriving from the repository
  Future<void> fetchReviewingYourDriving(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _reviewingYourDriving = await _repository.fetchReviewingYourDriving(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch document: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}