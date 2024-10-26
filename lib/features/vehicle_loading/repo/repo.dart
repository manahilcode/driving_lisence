import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/models.dart';

class VehicleLoadingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all vehicle loading data
  Future<Map<String, dynamic>> getAllVehicleLoadingData() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('data').get();

    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    } else {
      throw Exception("Document does not exist");
    }
  }

  // Fetch specific model data
  Future<Animal> getAnimal() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('Animals').get();
    if (snapshot.exists) {
      return Animal.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Animal document does not exist");
    }
  }

  Future<IntroductionVehicleLoading> getIntroductionVehicleLoading() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('Introduction').get();
    if (snapshot.exists) {
      return IntroductionVehicleLoading.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Introduction Vehicle Loading document does not exist");
    }
  }

  Future<ThinkAboutVehicleLoading> getThinkAboutVehicleLoading() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('Think_about').get();
    if (snapshot.exists) {
      return ThinkAboutVehicleLoading.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Think About Vehicle Loading document does not exist");
    }
  }

  Future<VehicleKeepStable> getVehicleKeepStable() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('keeping_your_car_stable').get();
    if (snapshot.exists) {
      return VehicleKeepStable.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Vehicle Keep Stable document does not exist");
    }
  }

  Future<MeetingStandardVehicleLoading> getMeetingStandardVehicleLoading() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('meeting_the_standard').get();
    if (snapshot.exists) {
      return MeetingStandardVehicleLoading.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Meeting Standard Vehicle Loading document does not exist");
    }
  }

  Future<PassengerVehicleLoader> getPassengerVehicleLoader() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('passengers').get();
    if (snapshot.exists) {
      return PassengerVehicleLoader.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Passenger Vehicle Loader document does not exist");
    }
  }

  Future<SavingFuelVehicleLoading> getSavingFuelVehicleLoading() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('saving_fuel').get();
    if (snapshot.exists) {
      return SavingFuelVehicleLoading.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Saving Fuel Vehicle Loading document does not exist");
    }
  }

  Future<DiscussWithInstructorVehicleLoading> getDiscussWithInstructorVehicleLoading() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('things_to_discuss_with_instructor').get();
    if (snapshot.exists) {
      return DiscussWithInstructorVehicleLoading.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Discuss With Instructor Vehicle Loading document does not exist");
    }
  }

  Future<TowingVehicleLoading> getTowingVehicleLoading() async {
    DocumentSnapshot snapshot = await _firestore.collection('vehicle_loading').doc('towing').get();
    if (snapshot.exists) {
      return TowingVehicleLoading.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Towing Vehicle Loading document does not exist");
    }
  }
}
