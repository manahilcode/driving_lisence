import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model.dart';

class SafetyMarginQuizRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QuizModel>> getQuizModels() async {
    List<QuizModel> quizList = [];
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection("safety_margin_quiz").get();

      print('Total documents: ${querySnapshot.docs.length}');

      for (var doc in querySnapshot.docs) {
        try {
          // Get the document data
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          // Print document data for debugging
          print('Processing document ID: ${doc.id}');
          print('Document data: $data');

          // Check for null or missing required fields before conversion
          if (data == null) {
            print('❌ Document ${doc.id} has null data');
            continue;
          }

          // You can add specific field checks here based on your QuizModel
          // For example:
          List<String> requiredFields = ['doc', 'question', 'answer','info','correct']; // Add your required fields
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

          // Try to create the QuizModel
          QuizModel quiz = QuizModel.fromJson(data);
          quizList.add(quiz);
          print('✅ Successfully processed document ${doc.id}');

        } catch (e) {
          print('❌ Error processing document ${doc.id}:');
          print('Error details: $e');

          // Print the raw data of the problematic document
          print('Raw document data:');
          print(doc.data());
        }
      }

      print('Successfully processed ${quizList.length} out of ${querySnapshot.docs.length} documents');

    } catch (e) {
      print('Error fetching QuizModels: $e');
    }
    return quizList;
  }
}