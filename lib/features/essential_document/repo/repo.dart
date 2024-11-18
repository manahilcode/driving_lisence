import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class EssentialsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get single Introduction Essential Document
  Future<IntroductionEssentialDocument?> getIntroductionEssential(String documentId) async {
    try {
      final doc = await _firestore.collection('essential_document').doc(documentId).get();
      if (doc.exists) {
        return IntroductionEssentialDocument.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error fetching introduction essential: $e');
      rethrow;
    }
  }

  // Get all Introduction Essential Documents
  Future<List<IntroductionEssentialDocument>> getAllIntroductionEssentials() async {
    try {
      final querySnapshot = await _firestore.collection('essential_document').get();
      return querySnapshot.docs
          .map((doc) => IntroductionEssentialDocument.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching all introduction essentials: $e');
      rethrow;
    }
  }

  // Get single Discuss Instructor Document
  Future<DiscussInstructorDocument?> getDiscussInstructor(String documentId) async {
    try {
      final doc = await _firestore.collection('essential_document').doc(documentId).get();
      if (doc.exists) {
        return DiscussInstructorDocument.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error fetching discuss instructor: $e');
      rethrow;
    }
  }

  // Get all Discuss Instructor Documents
  Future<List<DiscussInstructorDocument>> getAllDiscussInstructors() async {
    try {
      final querySnapshot = await _firestore.collection('essential_document').get();
      return querySnapshot.docs
          .map((doc) => DiscussInstructorDocument.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching all discuss instructors: $e');
      rethrow;
    }
  }

  // Get single Essential Document
  Future<EssentialDocument?> getEssential(String documentId) async {
    try {
      final doc = await _firestore.collection('essential_document').doc(documentId).get();
      if (doc.exists) {
        return EssentialDocument.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error fetching essential: $e');
      rethrow;
    }
  }

  // Get all Essential Documents
  Future<List<EssentialDocument>> getAllEssentials() async {
    try {
      final querySnapshot = await _firestore.collection('essential_document').get();
      return querySnapshot.docs
          .map((doc) => EssentialDocument.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching all essentials: $e');
      rethrow;
    }
  }

  // Get single Insurance Essential Document
  Future<InsuranceEssentialDocument?> getInsuranceEssential(String documentId) async {
    try {
      final doc = await _firestore.collection('essential_document').doc(documentId).get();
      if (doc.exists) {
        return InsuranceEssentialDocument.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error fetching insurance essential: $e');
      rethrow;
    }
  }

  // Get all Insurance Essential Documents
  Future<List<InsuranceEssentialDocument>> getAllInsuranceEssentials() async {
    try {
      final querySnapshot = await _firestore.collection('essential_document').get();
      return querySnapshot.docs
          .map((doc) => InsuranceEssentialDocument.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching all insurance essentials: $e');
      rethrow;
    }
  }

  // Get single Meeting Standard Essential Document
  Future<MeetingStandardEssentialDocument?> getMeetingStandardEssential(String documentId) async {
    try {
      final doc = await _firestore.collection('essential_document').doc(documentId).get();
      if (doc.exists) {
        return MeetingStandardEssentialDocument.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error fetching meeting standard essential: $e');
      rethrow;
    }
  }

  // Get all Meeting Standard Essential Documents
  Future<List<MeetingStandardEssentialDocument>> getAllMeetingStandardEssentials() async {
    try {
      final querySnapshot = await _firestore.collection('essential_document').get();
      return querySnapshot.docs
          .map((doc) => MeetingStandardEssentialDocument.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching all meeting standard essentials: $e');
      rethrow;
    }
  }

  Future<DrivingLicence?> getDrivingLicence(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('essential_document').doc(documentId).get();

      if (snapshot.exists) {
        return DrivingLicence.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  // Get single MOT Test
  Future<MotTest?> getMotTest(String documentId) async {
    try {
      final doc = await _firestore.collection('essential_document').doc(documentId).get();
      if (doc.exists) {
        return MotTest.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error fetching MOT test: $e');
      rethrow;
    }
  }

  // Get all MOT Tests
  Future<List<MotTest>> getAllMotTests() async {
    try {
      final querySnapshot = await _firestore.collection('essential_document').get();
      return querySnapshot.docs
          .map((doc) => MotTest.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching all MOT tests: $e');
      rethrow;
    }
  }

  // Get single Registering and Owning Car Document
  Future<RegisteringAndOwningCar?> getRegisteringAndOwningCar(String documentId) async {
    try {
      final doc = await _firestore.collection('essential_document').doc(documentId).get();
      if (doc.exists) {
        return RegisteringAndOwningCar.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error fetching registering and owning car: $e');
      rethrow;
    }
  }

  // Get all Registering and Owning Car Documents
  Future<List<RegisteringAndOwningCar>> getAllRegisteringAndOwningCars() async {
    try {
      final querySnapshot = await _firestore.collection('essential_document').get();
      return querySnapshot.docs
          .map((doc) => RegisteringAndOwningCar.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching all registering and owning cars: $e');
      rethrow;
    }
  }

  // Get single Think About Essential Document
  Future<ThinkAboutEssentialDocument?> getThinkAboutEssential(String documentId) async {
    try {
      final doc = await _firestore.collection('essential_document').doc(documentId).get();
      if (doc.exists) {
        return ThinkAboutEssentialDocument.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error fetching think about essential: $e');
      rethrow;
    }
  }

  // Get all Think About Essential Documents
  Future<List<ThinkAboutEssentialDocument>> getAllThinkAboutEssentials() async {
    try {
      final querySnapshot = await _firestore.collection('essential_document').get();
      return querySnapshot.docs
          .map((doc) => ThinkAboutEssentialDocument.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching all think about essentials: $e');
      rethrow;
    }
  }
}