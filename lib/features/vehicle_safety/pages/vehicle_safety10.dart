import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/vehicle_safety/pages/vehicle_safety_11.dart';
import 'package:flutter/material.dart';
import 'package:driving_lisence/features/vehicle_safety/pages/vehicle_safety_9.dart';

import '../../../core/loader.dart';

class Safety10 extends StatefulWidget {
  @override
  _Safety10State createState() => _Safety10State();
}

class _Safety10State extends State<Safety10> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('safety_10');

  // Function to fetch data from Firestore
  Future<Map<String, dynamic>?> fetchData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('safety_10.10').get();
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
          'Safety before driving',
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
           return const LoadingScreen();

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
            final caption4 = data['image_caption4'];

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

                  // Display all images and captions in a column
                  Column(
                    children: [
                      if (image1 != null)
                        Column(
                          children: [
                            Image.network(image1),
                            SizedBox(height: 8),
                            if (caption1 != null)
                              Text(
                                caption1,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            SizedBox(height: 16),
                          ],
                        ),
                      if (image2 != null)
                        Column(
                          children: [
                            Image.network(image2),
                            SizedBox(height: 8),
                            if (caption2 != null)
                              Text(
                                caption2,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            SizedBox(height: 16),
                          ],
                        ),
                      if (image3 != null)
                        Column(
                          children: [
                            Image.network(image3),
                            SizedBox(height: 8),
                            if (caption3 != null)
                              Text(
                                caption3,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            SizedBox(height: 16),
                          ],
                        ),
                      if (image4 != null)
                        Column(
                          children: [
                            Image.network(image4),
                            SizedBox(height: 8),
                            if (caption4 != null)
                              Text(
                                caption4,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            SizedBox(height: 16),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Safety_11()),
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
        },
      ),
    );
  }
}
