import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/hazard/pages/hazard_12.dart';
import 'package:flutter/material.dart';

import '../../../core/loader.dart';

class hazard_11 extends StatefulWidget {
  const hazard_11({super.key});

  @override
  _hazard_11State createState() => _hazard_11State();
}

class _hazard_11State extends State<hazard_11> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('hazard_11');

  // Method to fetch document fields from Firestore
  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('hazard_11.11').get();
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching alert data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Things to discuss and practise with your instructor',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchAlertData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
           return const LoadingScreen();

          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available.'));
          } else {
            final data = snapshot.data!;
            final title = data['Title'];
            final points = data['points'] != null
                ? List<String>.from(data['points'])
                : [];

            final points_1 = data['points_1'] != null
                ? List<String>.from(data['points_1'])
                : [];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the first title and points
                  if (title != null)
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  SizedBox(height: 20),
                  Text(
                    "You must be able to",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  if (points.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: points.map((point) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              point,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  SizedBox(height: 30),

                  // Display the second title and points

                    Text(
                      "You must know and understand",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  SizedBox(height: 20),

                  if (points_1.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: points_1.map((point) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              point,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  SizedBox(height: 30),

                  // Navigation Button
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next tip or page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => hazard12()), // Change this
                        );
                      },
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
