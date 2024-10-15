import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/alert_7.dart';
import 'package:flutter/material.dart';

class TipAttitude6 extends StatefulWidget {
  @override
  _TipAttitude6State createState() => _TipAttitude6State();
}

class _TipAttitude6State extends State<TipAttitude6> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('alert_5');

  // Method to fetch document fields from Firestore
  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('alert_5.5').get();
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
          'Zebra Crossing Rules',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchAlertData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available.'));
          } else {
            final data = snapshot.data!;
            final images = [data['Image_1'], ];
            final title = data['Title'];
            final additionalInfo = data['additional info'];
            final subRules = data['subRules'] != null ? List<String>.from(data['subRules']) : [];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'No Title',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(additionalInfo ?? 'No additional info', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  // Display Images
                  for (String imageUrl in images)
                    imageUrl != null
                        ? Image.network(
                      imageUrl,
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
                        print('Error loading image: $error');
                        return Column(
                          children: [
                            Icon(Icons.error),
                            Text('Error loading image: ${error.toString()}'),
                          ],
                        );
                      },
                    )
                        : Container(),
                  SizedBox(height: 20),
                  // Display SubRules
                  if (subRules.isNotEmpty) ...[
                    Text(
                      'Pedestrians at or approaching a zebra crossing.',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (String rule in subRules)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          rule,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                  ],
                  SizedBox(height: 20),
                  // Navigation Button
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TipAttitude7()),
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

