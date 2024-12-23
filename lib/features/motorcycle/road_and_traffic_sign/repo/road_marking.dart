import 'dart:convert';  // For JSON decoding
import 'package:flutter/services.dart';  // For loading local JSON if needed
import 'package:http/http.dart' as http;

import '../model/road_marking.dart';  // For API calls

class RoadMarkingsRepository {
  final String apiUrl = "https://your-api-url.com/roadmarkings"; // Replace with your API URL

  // Method to fetch data from an API
  Future<RoadMarkingsData> fetchRoadMarkingsData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the data
        Map<String, dynamic> data = json.decode(response.body);
        return RoadMarkingsData.fromJson(data);
      } else {
        // If the response is not OK, throw an exception
        throw Exception('Failed to load road markings data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  // If you want to load local JSON (for testing or fallback purposes)
  Future<RoadMarkingsData> fetchRoadMarkingsDataFromLocal() async {
    try {
      final String response = await rootBundle.loadString('assets/road_markings.json');
      final data = json.decode(response);
      return RoadMarkingsData.fromJson(data);
    } catch (e) {
      throw Exception('Error loading local data: $e');
    }
  }
}
