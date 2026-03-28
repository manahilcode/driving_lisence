import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/vehicle_safety/pages/safety_19.dart';
import 'package:flutter/material.dart';

import '../../../core/loader.dart';

class Safety_18 extends StatefulWidget {
  @override
  _Safety_18State createState() => _Safety_18State();
}

class _Safety_18State extends State<Safety_18> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('safety_18');

  // Function to fetch alert data
  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('safety_18.18').get();
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
            final title = data['title'] as String?;
            final tip1 = data['tip1'] as String?;
            final tip2 = data['tip2'] as String?;
            final tip3 = data['tip3'] as String?;
            final point1 = (data['point1'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
            final point2 = (data['point2'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
            final point3 = (data['point3'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
            final thinkabout = (data['thinkabout'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
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
                  SizedBox(height: 20),
                  Text(
                    "You must know and understand",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildTipWithPoints(tip1, point1),
                  _buildTipWithPoints(tip2, point2),
                  _buildTipWithPoints(tip3, point3),
                  SizedBox(height: 20,),
                  Text("Think about",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 30, color:Colors.green
                  ),),
                  SizedBox(height: 20,),
                  if (thinkabout.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: thinkabout.map((point) {
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
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>safety_19()),
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

  Widget _buildTipWithPoints(String? tip, List<String> points) {
    if (tip == null) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• $tip',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildSubPoints(points),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildSubPoints(List<String> points) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points.map((point) => Text('• $point', style: TextStyle(fontSize: 16))).toList(),
      ),
    );
  }
}