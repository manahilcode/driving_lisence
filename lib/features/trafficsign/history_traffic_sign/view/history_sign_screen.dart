import 'package:driving_lisence/features/trafficsign/history_traffic_sign/viewmodel/history_sign_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';

class HistorySignScreen extends StatefulWidget {
  const HistorySignScreen({super.key});

  @override
  State<HistorySignScreen> createState() => _HistorySignScreenState();
}

class _HistorySignScreenState extends State<HistorySignScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_){
      final trafficSignProvider = Provider.of<TrafficSignProvider123>(context, listen: false);
      trafficSignProvider.fetchTrafficSignHistory();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "A Brief History of Traffic Signs", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => TrafficSignScreenMain(),
          ),
              (Route<dynamic> route) =>
          false, // Removes all previous routes
        );
      }),

      // appBar: AppBar(
      //   title: Text('A Brief History of Traffic Signs'),
      // ),
      body: Consumer<TrafficSignProvider123>(
        builder: (context, trafficSignProvider, child) {
          if (trafficSignProvider.isLoading) {
            return Center(child: LoadingScreen());
          }

          if (trafficSignProvider.trafficSignHistory == null) {
            return Center(child: Text('No data available'));
          }

          final history = trafficSignProvider.trafficSignHistory!;

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(history.image),
                _buildText(history.text),
                _buildImage(history.image1),
                _buildText(history.text1),
                _buildImage(history.image2),
                _buildText(history.text2),
                _buildImage(history.image3),
                _buildText(history.text3),
                _buildImage(history.image4),
                _buildText(history.text4),
                _buildImage(history.image5),
                _buildText(history.text5),
                _buildImage(history.image6),
                _buildText(history.text6),
                _buildImage(history.image7),
                _buildText(history.text7),
                _buildText(history.text8),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      //   Navigate to the next tip or page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrafficSignScreenMain(),
                        ),
                            (Route<dynamic> route) =>
                        false, // Removes all previous routes
                      );
                    },
                    child: Center(
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(
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
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
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
                ),
              ],
            ),
          );
        },
      ),

    );
  }
}

Widget _buildImage(String imageUrl) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Image.network(imageUrl, fit: BoxFit.cover),
  );
}

Widget _buildText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      text,
      style: TextStyle(fontSize: 16, height: 1.5),
    ),
  );
}

