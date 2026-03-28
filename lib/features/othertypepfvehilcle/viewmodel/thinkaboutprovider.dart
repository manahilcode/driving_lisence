// other_vehicle_intro_provider.dart
import 'package:driving_lisence/features/othertypepfvehilcle/repo/bueses_repo.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/repo/introrep.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/repo/meeting_standard_repo.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/repo/thinkaboutrepo.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/repo/tramsrepo.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/think_about.dart';
import 'package:flutter/material.dart';

class ThinkaboutProvider with ChangeNotifier {
  final thinkaboutRepository  _repository = thinkaboutRepository();

  Map<String, dynamic>? _alertData;


  Map<String, dynamic>? get alertData => _alertData;


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
}