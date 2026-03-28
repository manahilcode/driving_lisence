import 'package:cloud_firestore/cloud_firestore.dart';

class ResultRepo {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Map<String,dynamic>?>? getResultAlertness(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }

  Future<Map<String,dynamic>?>? getResultAttitude(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }

  Future<Map<String,dynamic>?>? getResultSafetyVehicle(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }
  Future<Map<String,dynamic>?>? getResultSafetyMargin(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }

  Future<Map<String,dynamic>?>? getResultHazardAwareness(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }
  Future<Map<String,dynamic>?>? getResultVulnerableRoadUser(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }

  Future<Map<String,dynamic>?>? getResultOtherTypeVehicle(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }

  Future<Map<String,dynamic>?>? getResultMotorWaydriving(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }

  Future<Map<String,dynamic>?>? getResultVehicleHandling(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }
  Future<Map<String,dynamic>?>? getResultRuleOfRoad(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }
  Future<Map<String,dynamic>?>? getResultRoadTrafficSign(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }
  Future<Map<String,dynamic>?>? getResultEssentialDocument(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }
  Future<Map<String,dynamic>?>? getResulIncident(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }
  Future<Map<String,dynamic>?>? getResultVehicleLoading(String doc) async {

    try {
      DocumentSnapshot querySnapshot = await _firestore.collection('result').doc(doc).get();
      Map<String ,dynamic> data = querySnapshot.data() as Map<String ,dynamic>;
      return data;
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }

  }

}