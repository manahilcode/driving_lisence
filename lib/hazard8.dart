import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/hazard9.dart';
import 'package:flutter/material.dart';

import 'vehicle_safety_9.dart'; // Assuming this file exists in your project

class hazard8 extends StatefulWidget {
  @override
  _hazard8State createState() => _hazard8State();
}

class _hazard8State extends State<hazard8> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('hazard_8');

  // Function to fetch data from Firestore
  Future<Map<String, dynamic>?> fetchData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('hazard_8.8').get();
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Seat belts and restraints',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available.'));
          } else {
            final data = snapshot.data!;
            final title = data['title'];
            final subtitle = data['subtitle'];
            final image1 = data['image_1'];
            final caption1 = data['image_caption1'];
            final image2 = data['image_2'];
            final caption2 = data['image_caption2'];
            final image3 = data['image_3'];
            final caption3 = data['image_caption3'];
            final image4 = data['image_4'];
            final caption4 = data['image_caption4'];// This is an array now


            return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      SizedBox(height: 10),

                      if (subtitle != null)
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      SizedBox(height: 20),


                      if (image1 != null)
                        Image.network(image1),
                      if (caption1 != null)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              caption1,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      SizedBox(height: 20),


                      if (image2 != null)
                        Image.network(image2),
                      if (caption2 != null)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              caption2,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      SizedBox(height: 20),

                      // Display image 3 and caption 3 (array handling)
                      if (image3 != null)
                        Image.network(image3),
                      if (caption3 != null)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              caption3,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      SizedBox(height: 20),
                      if (image4 != null)
                        Image.network(image4),
                      if (caption4 != null)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              caption4,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      SizedBox(height: 20),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => hazard_9())); // Assuming vehicle_safety_9.dart exists
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

                    ]
                )
            );
          }
        },
      ),
    );
  }
}
