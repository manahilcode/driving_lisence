import 'package:driving_lisence/core/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/direction_provider.dart';

class DirectionScreen321 extends StatefulWidget {
  const DirectionScreen321({super.key});

  @override
  State<DirectionScreen321> createState() => _DirectionScreen321State();
}

class _DirectionScreen321State extends State<DirectionScreen321> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final signProvider = Provider.of<SignProvider>(context, listen: false);
      signProvider.fetchSignData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Direction Sign",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => TrafficSignScreenMain(),
              ),
              (Route<dynamic> route) => false, // Removes all previous routes
            );
          }),
      // appBar: AppBar(
      //   title: Text('Motorway Signs'),
      // ),
      body: Consumer<SignProvider>(
        builder: (context, signProvider, child) {
          if (signProvider.isLoading) {
            return Center(child: LoadingScreen());
          }

          if (signProvider.signData == null) {
            return Center(child: Text('No data available'));
          }

          final signData = signProvider.signData!;

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Text(
                signData.text,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ..._buildList(signData.text1),
              SizedBox(height: 20),
              ..._buildList(signData.text2),
              SizedBox(height: 20),
              ..._buildList(signData.text3),
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
          );
        },
      ),
    );
  }
}

List<Widget> _buildList(List<String> items) {
  return items.map((item) {
    if (item.startsWith('http')) {
      return Image.network(item);
    } else {
      return Text(item, style: TextStyle(fontSize: 16));
    }
  }).toList();
}
