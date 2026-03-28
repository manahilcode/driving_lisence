import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/vehicle_handling/model/model.dart';

class Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<IntroductionModel> fetchImageData() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('vehicle_handling') // Your Firestore collection
          .doc('introduction') // Your Firestore document ID
          .get();

      if (snapshot.exists) {
        return IntroductionModel.fromMap(
            snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<WeatherCondition?> fetchWeatherCondition() async {
    try {
      final docSnapshot = await _firestore
          .collection('vehicle_handling')
          .doc("Weather condition")
          .get();
      if (docSnapshot.exists) {
        // Convert the document data to WeatherCondition
        print(docSnapshot.id);
        return WeatherCondition.fromFirestore(
            docSnapshot.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null; // Return null if the document doesn't exist
      }
    } catch (e) {
      print("Error fetching weather condition: $e");
      return null;
    }
  }

  Future<FogModel> fetchFogData() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('vehicle_handling') // Your Firestore collection
          .doc('Fog') // Your Firestore document ID
          .get();

      print(snapshot.id);

      if (snapshot.exists) {
        print(snapshot.data());
        return FogModel.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<VeryBadWeatherModel> fetchVeryBadWeather() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('vehicle_handling') // Your Firestore collection
          .doc('very_bad_weather') // Your Firestore document ID
          .get();

      if (snapshot.exists) {
        return VeryBadWeatherModel.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
  Future<WindyModel> fetchWindyWeather() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('vehicle_handling') // Your Firestore collection
          .doc('windy_weather') // Your Firestore document ID
          .get();

      if (snapshot.exists) {
        return WindyModel.fromFirestore(
            snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
  Future<DrivingNightModel> fetchDriveNight() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('vehicle_handling') // Your Firestore collection
          .doc('Driving_at_night') // Your Firestore document ID
          .get();

      if (snapshot.exists) {
        return DrivingNightModel.fromFirestore(
            snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<KeepControlVehicleModel> fetchKeepControlVehicle() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('vehicle_handling') // Your Firestore collection
          .doc('keeping_control_of_your_vehicle') // Your Firestore document ID
          .get();

      if (snapshot.exists) {
        return KeepControlVehicleModel.fromFirestore(
            snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }


  Future<TrafficCalmingAndRoadSurfaces?> getTrafficCalmingData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('vehicle_handling') // Replace with your collection
          .doc('Traffic_claiming')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return TrafficCalmingAndRoadSurfaces.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }


  Future<MeetingStandard?> getMeetingStandardData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('vehicle_handling') // Replace with your collection name
          .doc('meeting_the_standard')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return MeetingStandard.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }


  Future<ThinkAbout?> getThinkAboutData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('vehicle_handling') // Replace with your collection name
          .doc('Think_about')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return ThinkAbout.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }


  Future<PracticeWithInstructor?> getPracticeWithInstructorData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('vehicle_handling') // Replace with your collection name
          .doc('discuss_with_your_instructor')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return PracticeWithInstructor.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

}
