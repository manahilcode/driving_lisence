import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/alert_6.dart';
import 'package:driving_lisence/priority_alert.dart';
import 'package:flutter/material.dart';

class TipAttitude5 extends StatefulWidget {
  @override
  _TipAttitude5State createState() => _TipAttitude5State();
}

class _TipAttitude5State extends State<TipAttitude5> {
  // Firestore collection reference
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('alert_4');

  Future<String?> fetchTip() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('alert_4.4').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return data['Tip_1'];
        // Fetch the 'Tip' field
      } else {
        return "No tip available.";
      }
    } catch (e) {
      print('Error fetching tip: $e');
      return "Error fetching tip.";
    }
  }

  // Method to fetch multiple images from Firestore
  Future<List<String>> fetchImages() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('alert_4.4').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        List<String> images = [];
        for (int i = 1; i <= 4; i++) {
          String? imageUrl = data['Image_$i'];
          if (imageUrl != null) {
            images.add(imageUrl);
          }
        }
        return images;
      } else {
        print('Document does not exist');
        return [];
      }
    } catch (e) {
      print('Error fetching images: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    // List of hardcoded texts for each image
    final List<String> imageTexts = [
      'HM coastguard',
      'Bomb disposal',
      'Mountain rescue',
      'Blood transfusion',
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Pro Tip',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Emergency vehicles", // Hardcoded heading
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 15),

              // FutureBuilder to display images with corresponding hardcoded texts
              FutureBuilder<List<String>>(
                future: fetchImages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No images available.');
                  } else {
                    List<String> images = snapshot.data!;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Display 2 images per row
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.network(
                              images[index],
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                        null
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
                                    Text('Error loading image'),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 5),
                            Text(
                              imageTexts[index], // Hardcoded text for each image
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),

              SizedBox(height: 20,),
              FutureBuilder<String?>(
                future: fetchTip(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text('No tip available.');
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Text(
                        snapshot.data!,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20,),

              // 'Next' button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TipAttitude6()), // Assuming this exists
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
          ),
        ),
      ),
    );
  }
}
