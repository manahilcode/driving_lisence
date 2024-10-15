import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/Safety_18.dart';
import 'package:driving_lisence/vehicle_safety12.dart';
import 'package:flutter/material.dart';

class Safety_17 extends StatefulWidget {
  @override
  _Safety_17State createState() => _Safety_17State();
}

class _Safety_17State extends State<Safety_17> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('safety_17');

  // Function to fetch alert data
  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('safety_17.17').get();
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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available.'));
          } else {
            final data = snapshot.data!;
            final title = data['title'] as String?;
            final point1 = (data['point1'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
            final point2 = (data['point2'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
            final point4 = (data['point4'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
            final tips = [
              data['tip1'],
              data['tip2'],
              data['tip3'],
              data['tip4'],
            ].whereType<String>().toList();

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
                  _buildPointList(tips, point1, point2, point4),
                  SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Safety_18()),
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

  Widget _buildPointList(List<String> tips, List<String> point1, List<String> point2, List<String> point4) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < tips.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ${tips[i]}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (i == 0)
                _buildSubPoints(point1)
              else if (i == 1)
                _buildSubPoints(point2)
              else if (i == 3)
                  _buildSubPoints(point4),
              SizedBox(height: 10),
            ],
          ),
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