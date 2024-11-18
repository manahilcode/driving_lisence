import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/models.dart';
import '../repo/repo.dart';

class VehicleLoadingProvider extends ChangeNotifier {
  final VehicleLoadingRepository _repository = VehicleLoadingRepository();

  // Models
  Animal? animal;
  IntroductionVehicleLoading? introductionVehicleLoading;
  ThinkAboutVehicleLoading? thinkAboutVehicleLoading;
  VehicleKeepStable? vehicleKeepStable;
  MeetingStandardVehicleLoading? meetingStandardVehicleLoading;
  PassengerVehicleLoader? passengerVehicleLoader;
  SavingFuelVehicleLoading? savingFuelVehicleLoading;
  DiscussWithInstructorVehicleLoading? discussWithInstructorVehicleLoading;
  TowingVehicleLoading? towingVehicleLoading;

  // Fetch Animal data
  Future<void> fetchAnimal() async {
    try {
      animal = await _repository.getAnimal();
      notifyListeners();
    } catch (e) {
      print("Error fetching animal: $e");
      throw e; // You can handle the error as needed
    }
  }

  // Fetch Introduction Vehicle Loading data
  Future<void> fetchIntroductionVehicleLoading() async {
    try {
      introductionVehicleLoading =
          await _repository.getIntroductionVehicleLoading();
      notifyListeners();
    } catch (e) {
      print("Error fetching introduction vehicle loading: $e");
      throw e;
    }
  }

  // Fetch Think About Vehicle Loading data
  Future<void> fetchThinkAboutVehicleLoading() async {
    try {
      thinkAboutVehicleLoading =
          await _repository.getThinkAboutVehicleLoading();
      notifyListeners();
    } catch (e) {
      print("Error fetching think about vehicle loading: $e");
      throw e;
    }
  }

  // Fetch Vehicle Keep Stable data
  Future<void> fetchVehicleKeepStable() async {
    try {
      vehicleKeepStable = await _repository.getVehicleKeepStable();
      notifyListeners();
    } catch (e) {
      print("Error fetching vehicle keep stable: $e");
      throw e;
    }
  }

  // Fetch Meeting Standard Vehicle Loading data
  Future<void> fetchMeetingStandardVehicleLoading() async {
    try {
      meetingStandardVehicleLoading =
          await _repository.getMeetingStandardVehicleLoading();
      notifyListeners();
    } catch (e) {
      print("Error fetching meeting standard vehicle loading: $e");
      throw e;
    }
  }

  // Fetch Passenger Vehicle Loader data
  Future<void> fetchPassengerVehicleLoader() async {
    try {
      passengerVehicleLoader = await _repository.getPassengerVehicleLoader();
      notifyListeners();
    } catch (e) {
      print("Error fetching passenger vehicle loader: $e");
      throw e;
    }
  }

  // Fetch Saving Fuel Vehicle Loading data
  Future<void> fetchSavingFuelVehicleLoading() async {
    try {
      savingFuelVehicleLoading =
          await _repository.getSavingFuelVehicleLoading();
      notifyListeners();
    } catch (e) {
      print("Error fetching saving fuel vehicle loading: $e");
      throw e;
    }
  }

  // Fetch Discuss With Instructor Vehicle Loading data
  Future<void> fetchDiscussWithInstructorVehicleLoading() async {
    try {
      discussWithInstructorVehicleLoading =
          await _repository.getDiscussWithInstructorVehicleLoading();
      notifyListeners();
    } catch (e) {
      print("Error fetching discuss with instructor vehicle loading: $e");
      throw e;
    }
  }

  // Fetch Towing Vehicle Loading data
  Future<void> fetchTowingVehicleLoading() async {
    try {
      towingVehicleLoading = await _repository.getTowingVehicleLoading();
      notifyListeners();
    } catch (e) {
      print("Error fetching towing vehicle loading: $e");
      throw e;
    }
  }
}
