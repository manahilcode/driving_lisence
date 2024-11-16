import 'package:cloud_firestore/cloud_firestore.dart';

import '../../all_categories_quiz/model/model.dart';

class AllCategory {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to fetch all QuizModels from specified collections
  Future<List<QuizModel>> getAllQuizModels() async {
    List<QuizModel> quizList = [];
    List<String> collections = [
      'alertquiz',
      'attitudequiz',
      'vehicle_loading_quiz',
      'hazard_awareness_quiz',
      'rule_of_the_road_quiz',
      'motorway_driving_quiz',
      'other_type_vehicle_quiz',
      'road_and_traffic_sign_quiz',
      'safety_margin_quiz',
      'safety_and_vehicle_quiz',
      'vehicle_handling_quiz',
      'vulnerable_road_user_quiz',
    ];

    for (String collection in collections) {
      try {
        QuerySnapshot querySnapshot = await _firestore.collection(collection).get();
        print('Total documents in $collection: ${querySnapshot.docs.length}');

        for (var doc in querySnapshot.docs) {
          try {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

            // Print document data for debugging
            print('Processing document ID: ${doc.id}');
            print('Document data: $data');

            // Check for null or missing required fields before conversion
            if (data == null) {
              print('❌ Document ${doc.id} has null data');
              continue;
            }

            List<String> requiredFields = ['doc', 'question', 'answer', 'info', 'correct']; // Required fields
            List<String> missingFields = [];

            for (String field in requiredFields) {
              if (!data.containsKey(field) || data[field] == null) {
                missingFields.add(field);
              }
            }

            if (missingFields.isNotEmpty) {
              print('❌ Document ${doc.id} is missing required fields: ${missingFields.join(", ")}');
              continue;
            }

            // Create the QuizModel and add it to the list
            QuizModel quiz = QuizModel.fromJson(data);
            quizList.add(quiz);
            print('✅ Successfully processed document ${doc.id}');

          } catch (e) {
            print('❌ Error processing document ${doc.id}: $e');
            print('Raw document data: ${doc.data()}');
          }
        }

      } catch (e) {
        print('Error fetching QuizModels from $collection: $e');
      }
    }

    print('Successfully fetched ${quizList.length} quiz models from all collections.');
    return quizList;
  }
}