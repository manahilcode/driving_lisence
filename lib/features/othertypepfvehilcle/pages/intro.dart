import 'package:driving_lisence/features/othertypepfvehilcle/pages/motercycle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/intro_provider.dart';

class Othertype1 extends StatefulWidget {
  @override
  _Othertype1State createState() => _Othertype1State();
}

class _Othertype1State extends State<Othertype1> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final provider = Provider.of<OtherVehicleIntroProvider>(context, listen: false);
      await Future.wait([
        provider.loadAlertData(),
        provider.loadImage(),
      ]);
    } catch (e) {
      print('Error loading data: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OtherVehicleIntroProvider>(
      builder: (context, provider, child) {
        // Show loading indicator while initial data is being fetched
        if (isLoading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Show error if data failed to load
        if (provider.alertData == null || provider.imageUrl == null) {
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
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error loading data. Please try again.'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _loadData,
                    child: Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        // Show the main content when data is loaded
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (provider.imageUrl != null)
                  Image.network(
                    provider.imageUrl!,
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
                          Text('Error loading image'),
                        ],
                      );
                    },
                  ),
                SizedBox(height: 20),
                Text(
                  provider.alertData!['title'] ?? '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "In this section, you'll learn about:",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10),
                if (provider.alertData!['points'] != null)
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (provider.alertData!['points'] as List<dynamic>)
                          .map((point) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          point,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                  ),


                SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Othertype2(), // Replace with your next screen
                        ),
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
          ),
        );
      },
    );
  }
}