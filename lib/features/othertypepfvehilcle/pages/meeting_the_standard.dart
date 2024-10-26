import 'package:driving_lisence/features/othertypepfvehilcle/model/Trams_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/bus_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/intro_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/meeting_the_standard_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/pages/Thinkabout.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/pages/disabled_people.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/pages/motercycle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Othertype8 extends StatefulWidget {
  @override
  _Othertype8State createState() => _Othertype8State();
}

class _Othertype8State extends State<Othertype8> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final provider = Provider.of<meetingstandardProvider>(context, listen: false);
      await Future.wait([
        provider.loadAlertData(),

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
    return Consumer<meetingstandardProvider>(
      builder: (context, provider, child) {
        // Show loading indicator while initial data is being fetched
        if (isLoading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Show error if data failed to load
        if (provider.alertData == null) {
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

                SizedBox(height: 20),
                Text(
                  provider.alertData!['title'] ?? '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20,),

                Text(
                  "You must be able to",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20,),
                if (provider.alertData!['points1'] != null)
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (provider.alertData!['points1'] as List<dynamic>)
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
                SizedBox(height: 20,),
                Text(
                  "You must know and understand",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20,),
                if (provider.alertData!['points2'] != null)
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (provider.alertData!['points2'] as List<dynamic>)
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
                          builder: (context) =>Othertype9(), // Replace with your next screen
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