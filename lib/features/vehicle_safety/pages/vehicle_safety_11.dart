import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/vehicle_safety/pages/vehicle_safety%20_2.dart';
import 'package:driving_lisence/features/vehicle_safety/pages/vehicle_safety12.dart';
import 'package:driving_lisence/features/vehicle_safety/pages/vehicle_safety_6.dart';
import 'package:flutter/material.dart';

import '../../../core/loader.dart';

class Safety_11  extends StatefulWidget {
  @override
  _Safety_11State createState() => _Safety_11State();
}

class _Safety_11State extends State<Safety_11> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('safety_11');

  // Function to fetch the image URL from Firestore
  Future<String?> fetchImage() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('safety_11.11').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        String? imageUrl = data['image']; // Fetch the 'image' field
        print('Fetched image URL: $imageUrl');
        return imageUrl;
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching image: $e');
      return null;
    }
  }

  // Function to fetch alert data
  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('safety_11.11').get();
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
          'Pro tip',
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
            final title = data['title'];
            final subtitle = data['subtitle'];
            final points = data['points'] != null ? List<String>.from(data['points']) : [];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image loaded from Firestore
                  FutureBuilder<String?>(
                    future: fetchImage(),
                    builder: (context, imageSnapshot) {
                      if (imageSnapshot.connectionState == ConnectionState.waiting) {
                       return const LoadingScreen();

                      } else if (imageSnapshot.hasError) {
                        return Center(child: Text('Error loading image: ${imageSnapshot.error}'));
                      } else if (!imageSnapshot.hasData || imageSnapshot.data == null) {
                        return Center(child: Text('No image available.'));
                      } else {
                        return Image.network(
                          imageSnapshot.data!,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Column(
                              children: [
                                Icon(Icons.error),
                                Text('Error loading image: $error'),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20),

                  // Display the title, subtitle, and points
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
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height: 5),
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
                                fontSize: 20,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>Safety12()), // Change this to the next screen
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
