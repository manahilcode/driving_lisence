import 'package:flutter/cupertino.dart';
import '../repo/result_repo.dart';

class ResultController extends ChangeNotifier {
  // Separate Maps for each quiz category
  Map<String, dynamic>? _alertness;
  Map<String, dynamic>? _attitude;
  Map<String, dynamic>? _safetyVehicle;
  Map<String, dynamic>? _safetyMargin;
  Map<String, dynamic>? _hazardAwareness;
  Map<String, dynamic>? _vulnerableRoadUser;
  Map<String, dynamic>? _otherTypeVehicle;
  Map<String, dynamic>? _motorWayDriving;
  Map<String, dynamic>? _vehicleHandling;
  Map<String, dynamic>? _ruleOfRoad;
  Map<String, dynamic>? _roadTrafficSign;
  Map<String, dynamic>? _essentialDocument;
  Map<String, dynamic>? _incident;
  Map<String, dynamic>? _vehicleLoading;

  // Getter methods for each result category
  Map<String, dynamic>? get alertness => _alertness;
  Map<String, dynamic>? get attitude => _attitude;
  Map<String, dynamic>? get safetyVehicle => _safetyVehicle;
  Map<String, dynamic>? get safetyMargin => _safetyMargin;
  Map<String, dynamic>? get hazardAwareness => _hazardAwareness;
  Map<String, dynamic>? get vulnerableRoadUser => _vulnerableRoadUser;
  Map<String, dynamic>? get otherTypeVehicle => _otherTypeVehicle;
  Map<String, dynamic>? get motorWayDriving => _motorWayDriving;
  Map<String, dynamic>? get vehicleHandling => _vehicleHandling;
  Map<String, dynamic>? get ruleOfRoad => _ruleOfRoad;
  Map<String, dynamic>? get roadTrafficSign => _roadTrafficSign;
  Map<String, dynamic>? get essentialDocument => _essentialDocument;
  Map<String, dynamic>? get incident => _incident;
  Map<String, dynamic>? get vehicleLoading => _vehicleLoading;

  // Setter methods for each result category
  void setAlertness(Map<String, dynamic>? value) {
    _alertness = value;
    notifyListeners();
  }

  void setAttitude(Map<String, dynamic>? value) {
    _attitude = value;
    notifyListeners();
  }

  void setSafetyVehicle(Map<String, dynamic>? value) {
    _safetyVehicle = value;
    notifyListeners();
  }

  void setSafetyMargin(Map<String, dynamic>? value) {
    _safetyMargin = value;
    notifyListeners();
  }

  void setHazardAwareness(Map<String, dynamic>? value) {
    _hazardAwareness = value;
    notifyListeners();
  }

  void setVulnerableRoadUser(Map<String, dynamic>? value) {
    _vulnerableRoadUser = value;
    notifyListeners();
  }

  void setOtherTypeVehicle(Map<String, dynamic>? value) {
    _otherTypeVehicle = value;
    notifyListeners();
  }

  void setMotorWayDriving(Map<String, dynamic>? value) {
    _motorWayDriving = value;
    notifyListeners();
  }

  void setVehicleHandling(Map<String, dynamic>? value) {
    _vehicleHandling = value;
    notifyListeners();
  }

  void setRuleOfRoad(Map<String, dynamic>? value) {
    _ruleOfRoad = value;
    notifyListeners();
  }

  void setRoadTrafficSign(Map<String, dynamic>? value) {
    _roadTrafficSign = value;
    notifyListeners();
  }

  void setEssentialDocument(Map<String, dynamic>? value) {
    _essentialDocument = value;
    notifyListeners();
  }

  void setIncident(Map<String, dynamic>? value) {
    _incident = value;
    notifyListeners();
  }

  void setVehicleLoading(Map<String, dynamic>? value) {
    _vehicleLoading = value;
    notifyListeners();
  }

  // The ResultRepo instance to interact with the data layer
  final ResultRepo _resultRepo = ResultRepo();

  // Fetch results for each category

  Future<void> getAlertnessResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultAlertness(doc);
    if (data != null) {
      setAlertness(data); // Set the result for Alertness
    } else {
      print('No data found for Alertness');
    }
  }

  Future<void> getAttitudeResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultAttitude(doc);
    if (data != null) {
      setAttitude(data); // Set the result for Attitude
    } else {
      print('No data found for Attitude');
    }
  }

  Future<void> getSafetyVehicleResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultSafetyVehicle(doc);
    if (data != null) {
      setSafetyVehicle(data); // Set the result for Safety Vehicle
    } else {
      print('No data found for Safety Vehicle');
    }
  }

  Future<void> getSafetyMarginResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultSafetyMargin(doc);
    if (data != null) {
      setSafetyMargin(data); // Set the result for Safety Margin
    } else {
      print('No data found for Safety Margin');
    }
  }

  Future<void> getHazardAwarenessResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultHazardAwareness(doc);
    if (data != null) {
      setHazardAwareness(data); // Set the result for Hazard Awareness
    } else {
      print('No data found for Hazard Awareness');
    }
  }

  Future<void> getVulnerableRoadUserResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultVulnerableRoadUser(doc);
    if (data != null) {
      setVulnerableRoadUser(data); // Set the result for Vulnerable Road User
    } else {
      print('No data found for Vulnerable Road User');
    }
  }

  Future<void> getOtherTypeVehicleResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultOtherTypeVehicle(doc);
    if (data != null) {
      setOtherTypeVehicle(data); // Set the result for Other Type Vehicle
    } else {
      print('No data found for Other Type Vehicle');
    }
  }

  Future<void> getMotorWayDrivingResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultMotorWaydriving(doc);
    if (data != null) {
      setMotorWayDriving(data); // Set the result for Motor Way Driving
    } else {
      print('No data found for Motor Way Driving');
    }
  }

  Future<void> getVehicleHandlingResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultVehicleHandling(doc);
    if (data != null) {
      setVehicleHandling(data); // Set the result for Vehicle Handling
    } else {
      print('No data found for Vehicle Handling');
    }
  }

  Future<void> getRuleOfRoadResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultRuleOfRoad(doc);
    if (data != null) {
      setRuleOfRoad(data); // Set the result for Rule of Road
    } else {
      print('No data found for Rule of Road');
    }
  }

  Future<void> getRoadTrafficSignResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultRoadTrafficSign(doc);
    if (data != null) {
      setRoadTrafficSign(data); // Set the result for Road Traffic Sign
    } else {
      print('No data found for Road Traffic Sign');
    }
  }

  Future<void> getEssentialDocumentResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultEssentialDocument(doc);
    if (data != null) {
      setEssentialDocument(data); // Set the result for Essential Document
    } else {
      print('No data found for Essential Document');
    }
  }

  Future<void> getIncidentResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResulIncident(doc);
    if (data != null) {
      setIncident(data); // Set the result for Incident
    } else {
      print('No data found for Incident');
    }
  }

  Future<void> getVehicleLoadingResult(String doc) async {
    Map<String, dynamic>? data = await _resultRepo.getResultVehicleLoading(doc);
    if (data != null) {
      setVehicleLoading(data); // Set the result for Vehicle Loading
    } else {
      print('No data found for Vehicle Loading');
    }
  }
}
