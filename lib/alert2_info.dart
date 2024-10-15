import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/QuestionPage_Attitude2.dart';
import 'package:flutter/material.dart';

class Tip_attitude_2 extends StatefulWidget {
  @override
  _Tip_attitude_2State createState() => _Tip_attitude_2State();
}

class _Tip_attitude_2State extends State<Tip_attitude_2> {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('alert_2');

  Future<String?> fetchTip() async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('alert_2.2').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return data['Tip'];
      } else {
        return "No tip available.";
      }
    } catch (e) {
      print('Error fetching tip: $e');
      return "Error fetching tip.";
    }
  }

  Future<String?> fetchImage(String imageField) async {
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('alert_2.2').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        String? imageUrl = data[imageField];
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

  @override
  Widget build(BuildContext context) {
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
                "Using your horn and lights",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        FutureBuilder<String?>(
                          future: fetchImage('Image'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data == null) {
                              return Text('No image available.');
                            } else {
                              return Image.network(
                                snapshot.data!,
                                width: double.infinity,
                                height: 170,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                          .expectedTotalBytes !=
                                          null
                                          ? loadingProgress
                                          .cumulativeBytesLoaded /
                                          loadingProgress
                                              .expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  print('Error loading image: $error');
                                  return Column(
                                    children: [
                                      Icon(Icons.error),
                                      Text('Error loading image'),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Following another vehicle',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between columns
                  Expanded(
                    child: Column(
                      children: [
                        FutureBuilder<String?>(
                          future: fetchImage('Image2'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data == null) {
                              return Text('No image available.');
                            } else {
                              return Image.network(
                                snapshot.data!,
                                width: double.infinity,
                                height: 170,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                          .expectedTotalBytes !=
                                          null
                                          ? loadingProgress
                                          .cumulativeBytesLoaded /
                                          loadingProgress
                                              .expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  print('Error loading image: $error');
                                  return Column(
                                    children: [
                                      Icon(Icons.error),
                                      Text('Error loading image'),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Meeting another vehicle coming towards you.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionPage_Attitude2()),
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
