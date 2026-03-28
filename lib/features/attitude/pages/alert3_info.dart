import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/loader.dart';
import 'QuestionPage_Attitude3.dart';

class Tip_attitude_3 extends StatefulWidget {
  @override
  _Tip_attitude_3State createState() => _Tip_attitude_3State();
}

class _Tip_attitude_3State extends State<Tip_attitude_3> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('alert_3');

  // Method to fetch the 'tip' field from Firestore
  Future<List<String>?> fetchTips() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('alert_3.3').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        List<dynamic>? tips = data['Tip']; // Fetch the 'Tip' field as a list
        if (tips != null) {
          return tips.cast<String>(); // Cast the dynamic list to a list of strings
        } else {
          return []; // Return an empty list if no tips are available
        }
      } else {
        return ["No tip available."];
      }
    } catch (e) {
      print('Error fetching tips: $e');
      return ["Error fetching tips."];
    }
  }

  // Method to fetch the 'Image' field from Firestore
  Future<String?> fetchImage() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('alert_3.3').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        String? imageUrl = data['image']; // Fetch the 'Image' field with capital 'I'
        print('Fetched image URL: $imageUrl'); // Debug print
        return imageUrl;
      } else {
        print('Document does not exist'); // Debug print
        return null;
      }
    } catch (e) {
      print('Error fetching image: $e');
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
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Following safely",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 15),
              FutureBuilder<String?>(
                future: fetchImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingScreen();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text('No image available.');
                  } else {
                    return Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: LoadingScreen(
                            // value: loadingProgress.expectedTotalBytes != null
                            //     ? loadingProgress.cumulativeBytesLoaded /
                            //     loadingProgress.expectedTotalBytes!
                            //     : null,
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
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              FutureBuilder<List<String>?>(
                future: fetchTips(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingScreen();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                    return Text('No tips available.');
                  } else {
                    // Concatenate all tips into a single string
                    String allTips = snapshot.data!.join('\n\n'); // Join tips with double line breaks
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Text(
                        allTips,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionPage_Attitude3()),
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
            ],
          ),
        ),
      ),
    );
  }
}
