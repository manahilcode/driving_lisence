import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/safety_margin/pages/safety_margin11.dart';
import 'package:flutter/material.dart';

import '../../../core/loader.dart';

class Safety_margin10 extends StatefulWidget {
  @override
  _Safety_margin10State createState() => _Safety_margin10State();
}

class _Safety_margin10State extends State<Safety_margin10> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('safety_margin10');
  Future<String?> fetchImage() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('safety_margin10.10').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        String? imageUrl = data['Image']; // Fetch the 'Image' field with capital 'I'
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
  Future<String?> fetchImage2() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('safety_margin10.10').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        String? imageUrl = data['Image1']; // Fetch the 'Image' field with capital 'I'
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
  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('safety_margin10.10').get();
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
          'Weather Condition',
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

            final points = data['points'] != null
                ? List<String>.from(data['points'])
                : [];
            final points1 = data['points2'] != null
                ? List<String>.from(data['points'])
                : [];
            final subtitle1 = data['subtitle2'];
            final subtitle2 = data['subtitle'];
            final title2 = data['title2'];


            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 20,),

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
                          width: double.infinity,
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
                  SizedBox(height: 10),
                  Text("Fog reduces your visibility. Remember to",),
                  SizedBox(height: 5,),
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
                  if (title2 != null)
                    Text(
                      title2,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  SizedBox(height: 10,),
                  if (subtitle1 != null)
                    Text(
                      subtitle1,
                      style: TextStyle(
                        fontSize:18,

                        color: Colors.black,
                      ),
                    ),
                  SizedBox(height: 30),
                  if (title2 != null)
                    Text(
                      title2,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  SizedBox(height: 10),
                  FutureBuilder<String?>(
                    future: fetchImage2(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingScreen();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return Text('No image available.');
                      } else {
                        return Image.network(
                          width: double.infinity,
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
                  SizedBox(height: 10,),
                  if (points1.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: points1.map((point) {
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

                  if (subtitle2 != null)
                    Text(
                      subtitle2,
                      style: TextStyle(
                        fontSize:18,

                        color: Colors.black,
                      ),
                    ),


                  SizedBox(height: 30),

                  // Navigation Button
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next tip or page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Safety_margin11()), // Change this
                        );
                      },
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 30.0,
                        ),
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
