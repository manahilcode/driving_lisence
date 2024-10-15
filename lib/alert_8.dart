import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/alert_9.dart';
import 'package:driving_lisence/attitude_practice_Question_screen.dart';
import 'package:flutter/material.dart';

class TipAttitude8 extends StatefulWidget {
  @override
  _TipAttitude8State createState() => _TipAttitude8State();
}

class _TipAttitude8State extends State<TipAttitude8> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('alert_8');

  // Method to fetch both titles and images from Firestore
  Future<Map<String, dynamic>?> fetchData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('alert_8.8').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return data; // Fetch all fields (Title, Title_2, Image_1, Image_2)
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Pro Tip',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<Map<String, dynamic>?>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data == null) {
                return Text('No data available.');
              } else {
                Map<String, dynamic> data = snapshot.data!;
                return Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("Puffin crossing",style: TextStyle(
                      fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10,),
                    if (data['Image_1'] != null)
                      Image.network(
                        data['Image_1'],
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
                      ),
                    Text(
                      data['Title'] ?? 'No Title available',
                      style: TextStyle(
                          fontSize:20,
                         
                          color: Colors.black),
                    ),
                    SizedBox(height: 15),

                    SizedBox(height: 10,),
                    Text("Toucan crossing",style: TextStyle(
                      fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10,),

                    SizedBox(height: 20),
                    if (data['Image_2'] != null)
                      Image.network(
                        data['Image_2'],
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
                      ),

                    // Title 2
                    Text(
                      data['Title_2'] ?? 'No Title available',
                      style: TextStyle(
                          fontSize: 20,
                          
                          color: Colors.black),
                    ),
                    SizedBox(height: 15),



                    // Button for navigation
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TipAttitude9()),
                        );
                      },
                      child: Container(
                        width: 300,
                        padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
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
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
