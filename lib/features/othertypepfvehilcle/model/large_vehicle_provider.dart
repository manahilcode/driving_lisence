// other_vehicle_intro_provider.dart
import 'package:driving_lisence/features/othertypepfvehilcle/repo/introrep.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/repo/large_vehiclerepo.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/repo/motercyclerepo.dart';
import 'package:flutter/material.dart';

class LargeVehicleProvider with ChangeNotifier {
  final largevehicleRepository _repository =largevehicleRepository();

  Map<String, dynamic>? _alertData;
  String? _imageUrl1;
  String? _imageUrl2;
  String? _imageUrl3;

  Map<String, dynamic>? get alertData => _alertData;
  String? get imageUrl1 => _imageUrl1;
  String? get imageUrl2 => _imageUrl2;
  String? get imageUrl3 => _imageUrl3;
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
      _imageUrl1 = (await _repository.fetchImage1()) as String?;
      print('Image URL loaded: $_imageUrl1'); // Debug print
      notifyListeners();
    } catch (e) {
      print('Error loading image: $e');
      _imageUrl1 = null;
      notifyListeners();
    }
  }
  Future<void> loadImage2() async {
    try {
      _imageUrl2 = (await _repository.fetchImage2()) as String?;
      print('Image URL loaded: $_imageUrl2'); // Debug print
      notifyListeners();
    } catch (e) {
      print('Error loading image: $e');
      _imageUrl2 = null;
      notifyListeners();
    }
  }
  Future<void> loadImage3() async {
    try {
      _imageUrl3 = (await _repository.fetchImage3()) as String?;
      print('Image URL loaded: $_imageUrl3'); // Debug print
      notifyListeners();
    } catch (e) {
      print('Error loading image: $e');
      _imageUrl3 = null;
      notifyListeners();
    }
  }


}