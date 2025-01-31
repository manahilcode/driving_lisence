//OnTheRoadRepository
import 'package:flutter/material.dart';
import '../model/about_theory_model.dart';
import '../model/driver_certification.dart';
import '../model/medical_requirement.dart';
import '../model/on_the_road.dart';
import '../model/other_study_aid.dart';
import '../repo/about_theory_repo.dart';
import '../repo/driver_certification_repo.dart';
import '../repo/medical_requirement_repo.dart';
import '../repo/on_the_road_repo.dart';
import '../repo/other_study_repo.dart';

class OtherStudyControllerProvider with ChangeNotifier {
  final OtherStudyRepository _repository;
  OtherStudyAid? _gettingInfo;
  bool _isLoading = false;
  String? _errorMessage;

  OtherStudyControllerProvider(this._repository);

  OtherStudyAid? get gettingInfo => _gettingInfo;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchInfo(String docId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _gettingInfo = await _repository.getInfo(docId);
    } catch (e) {
      _errorMessage = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
