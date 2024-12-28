import 'dart:convert';  // For JSON decoding
import 'package:flutter/services.dart';  // For loading local JSON if needed
import 'package:http/http.dart' as http;

import '../model/road_marking.dart';  // For API calls
//RoadMarkingsRepository

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoadMarkingsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RoadMarkingsData> fetchRoadMarkingsData(String collection, String document) async {
    try {
      // Fetch document snapshot from Firestore
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (!docSnapshot.exists) {
        throw Exception("Document does not exist in Firestore.");
      }

      // Retrieve data as a map
      final data = docSnapshot.data() as Map<String, dynamic>;

      // Log the data for debugging purposes
      log("Fetched data: $data");

      // Convert the map into a RoadMarkingsData object
      final roadMarkingsData = RoadMarkingsData.fromJson(data);

      // Log the object for verification
      log("RoadMarkingsData object: ${roadMarkingsData.toString()}");

      return roadMarkingsData;
    } catch (e) {
      log("Error fetching Road Markings data: $e");
      throw Exception("Failed to fetch Road Markings data: $e");
    }
  }
}
