import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/hazard/pages/hazard6.dart';
import 'package:flutter/material.dart';

import '../../../core/loader.dart';

class hazard_5 extends StatefulWidget {
  @override
  _hazard_5State createState() => _hazard_5State();
}

class _hazard_5State extends State<hazard_5> {
  // Reference to the Firestore collection
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('hazard_5');

  // Method to fetch document fields from Firestore
  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('hazard_5.5').get();
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
  Future<String?> fetchImage() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('hazard_5.5').get();
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
  Future<String?> fetchImage2() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('hazard_5.5').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        String? imageUrl = data['image2']; // Fetch the 'Image' field with capital 'I'
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
        title: const Text(
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
            final title_1 = data['title2'];
            final subtitle2 = data['subtitle2'];
            final points_1 = data['points'] != null
                ? List<String>.from(data['points'])
                : [];
            final title_3 = data['title3'];
            final subtitle3 = data['subtitle3'];
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
                  if (title != null)
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  SizedBox(height: 5,),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize:18,
                      ),
                    ),
                  SizedBox(height: 20,),
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
                  if (title_1 != null)
                    Text(
                      title_1,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  SizedBox(height:5,),
                  if (subtitle2 != null)
                    Text(
                      subtitle2,
                      style: TextStyle(
                        fontSize: 18,

                      ),
                    ),
                  SizedBox(height: 20),

                  if (points_1.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: points_1.map((point) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              point,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  SizedBox(height: 10,),
                  if (title_3 != null)
                    Text(
                      title_3,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  SizedBox(height: 5,),
                  if (subtitle3 != null)
                    Text(
                      subtitle3,
                      style: TextStyle(
                        fontSize:18,
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
                              builder: (context) => hazard6()), // Change this
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
