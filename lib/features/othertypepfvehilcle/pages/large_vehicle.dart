import 'package:driving_lisence/features/othertypepfvehilcle/pages/large_vehicle2.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/pages/motercycle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/large_vehicle_provider.dart';

class Othertype3 extends StatefulWidget {
  @override
  _Othertype3State createState() => _Othertype3State();
}

class _Othertype3State extends State<Othertype3> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final provider = Provider.of<LargeVehicleProvider>(context, listen: false);
      await Future.wait([
        provider.loadAlertData(),
        provider.loadImage(),
        provider.loadImage2(),
        provider.loadImage3(),
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
    return Consumer<LargeVehicleProvider>(
      builder: (context, provider, child) {
        // Show loading indicator while initial data is being fetched
        if (isLoading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Show error if data failed to load
        if (provider.alertData == null || provider.imageUrl1 == null || provider.imageUrl2 == null || provider.imageUrl3 == null ) {
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
                Text(
                  provider.alertData!['title'] ?? '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
            provider.alertData!['subtitle'] ?? '',
            style: TextStyle(
              fontSize: 18,

            ),
          ),
                SizedBox(height: 10,),
                Text(
                 'Overtaking a large vehicle is risky because it takes more time to overtake than a car.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10,),
                if (provider.imageUrl1 != null)
                  Image.network(
                    provider.imageUrl1!,
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
                Text(
                  provider.alertData!['imagecaption_1'] ?? '',
                  style: TextStyle(
                    fontSize: 18,

                  ),
                ),
                SizedBox(height: 10),
                if (provider.imageUrl2 != null)
                  Image.network(
                    provider.imageUrl2!,
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
                SizedBox(height: 10),
                Text(
                  provider.alertData!['imagecaption_2'] ?? '',
                  style: TextStyle(
                    fontSize: 18,

                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'In wet weather',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 5,),
                if (provider.imageUrl3 != null)
                  Image.network(
                    provider.imageUrl3!,
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
                SizedBox(height: 10,),
                Text(
                  provider.alertData!['subtitle2'] ?? '',
                  style: TextStyle(
                    fontSize: 18,

                  ),
                ),
                SizedBox(height: 20),


                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Othertype4(), // Replace with your next screen
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