// other_vehicle_intro_provider.dart
import 'package:driving_lisence/features/othertypepfvehilcle/repo/bueses_repo.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/repo/disabled_people_repo.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/repo/introrep.dart';
import 'package:flutter/material.dart';

class disabledProvider with ChangeNotifier {
  final DisabledPeopleRepo _repository = DisabledPeopleRepo();

  Map<String, dynamic>? _alertData;
  String? _imageUrl;

  Map<String, dynamic>? get alertData => _alertData;
  String? get imageUrl => _imageUrl;

  Future<void> loadAlertData() async {
    try {
      _alertData = await _repository.fetchAlertData();
      print('Alert Data loaded: $_alertData'); // Debug print
      notifyListeners();
    } catch (e) {
      print('Error loading alert data: $e');
      _alertData = null;
      notifyListeners();
    }
  }

  Future<void> loadImage() async {
    try {
      _imageUrl = await _repository.fetchImage();
      print('Image URL loaded: $_imageUrl'); // Debug print
      notifyListeners();
    } catch (e) {
      print('Error loading image: $e');
      _imageUrl = null;
      notifyListeners();
    }
  }
}