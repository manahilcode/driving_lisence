import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/safety_margin/pages/safety_margin7.dart';
import 'package:flutter/material.dart';

class SafetyMargin6 extends StatefulWidget {
  @override
  _SafetyMargin6State createState() => _SafetyMargin6State();
}

class _SafetyMargin6State extends State<SafetyMargin6> {
  // Holds the selected answer index
  int? selectedAnswerIndex;
  bool isCorrect = false;

  // Replace with your Firestore instance
  final CollectionReference questionCollection = FirebaseFirestore.instance.collection('safety_margin6');

  Future<Map<String, dynamic>> fetchQuestion() async {
    DocumentSnapshot docSnapshot = await questionCollection.doc('safety_margin6.6').get();
    return docSnapshot.data() as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Question 1/20',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchQuestion(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          Map<String, dynamic> data = snapshot.data!;
          String question = data['Question'];
          Map<String, dynamic> answers = data['Answers'];
          String correctAnswer = data['correct'];
          String imageUrl = data['image']; // Fetching image
          String tip = data['tip']; // Fetching tip

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    question,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  // Display answers as buttons
                  ...answers.entries.map((entry) {
                    String answerKey = entry.key; // Key is a string
                    String answerText = entry.value;

                    // Convert answerKey to an int (assuming answer keys are integers in string form)
                    int answerIndex = int.tryParse(answerKey) ?? 0;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: ListTile(
                          title: Text(answerText),
                          tileColor: selectedAnswerIndex != null
                              ? answerText == correctAnswer
                              ? Colors.green.withOpacity(0.7)
                              : selectedAnswerIndex == answerIndex
                              ? Colors.red.withOpacity(0.7)
                              : null
                              : null,
                          trailing: selectedAnswerIndex != null
                              ? answerText == correctAnswer
                              ? Icon(Icons.check, color: Colors.green)
                              : selectedAnswerIndex == answerIndex
                              ? Icon(Icons.close, color: Colors.red)
                              : null
                              : null,
                          onTap: selectedAnswerIndex == null
                              ? () {
                            setState(() {
                              selectedAnswerIndex = answerIndex;
                              isCorrect = answerText == correctAnswer;
                            });
                          }
                              : null,
                        ),
                      ),
                    );
                  }).toList(),

                  SizedBox(height: 20),

                  // Display the tip below the answers
                  Text(
                    "Tip: $tip",
                    style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
                  ),

                  SizedBox(height: 20),

                  // Display the image below the answers
                  imageUrl.isNotEmpty
                      ? Image.network(imageUrl)
                      : SizedBox.shrink(),

                  SizedBox(height: 70),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SafetyMargin7()),
                        );
                      },
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                          color: Colors.green, // Background color of the button
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Position of the shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 18.0, // Font size
                              fontWeight: FontWeight.bold, // Font weight
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
