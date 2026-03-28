import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/safety_margin/pages/safety_margin14.dart';
import 'package:flutter/material.dart';

import '../../../core/loader.dart';

class SafetyMargin13 extends StatefulWidget {
  @override
  _SafetyMargin13State createState() => _SafetyMargin13State();
}

class _SafetyMargin13State extends State<SafetyMargin13> {
  // Firestore reference to the collection and document
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('safety_margin13');

  // Fetch Firestore document data
  Future<DocumentSnapshot> fetchAlertData() async {
    return await collectionReference.doc('safety_margin13.13').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pro tip',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: fetchAlertData(),
        builder: (context, snapshot) {
          // Handle loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
           return const LoadingScreen();

          }

          // Handle error state
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching data: ${snapshot.error}'));
          }

          // Once data is fetched, proceed
          if (snapshot.hasData && snapshot.data != null) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

            // Extract data from Firestore document
            String? title = data['title'];
            List<dynamic>? points1 = data['points1'];
            String? title2 = data['title2'];
            List<dynamic>? points = data['points'];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display title and points1 section within containers
                  if (title != null)
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 10),
                          if (points1 != null)
                            ...points1.map((point) => Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                point,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            )),
                        ],
                      ),
                    ),

                  SizedBox(height: 20),

                    Text(
                      "You must be able to understand",
                      style: TextStyle(
                        fontSize: 24,

                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height:10),
                  if (points!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: points.map((point) { // Now mapping over points2
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              point,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,

                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),


                  SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Safety_margin14()),
                        );
                      },
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
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

          // In case no data is found
          return Center(child: Text('No data available.'));
        },
      ),
    );
  }
}
