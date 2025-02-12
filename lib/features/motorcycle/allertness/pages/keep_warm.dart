import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/keep_warm_provider.dart';
import 'distraction.dart';

class KeepWarmScreen extends StatefulWidget {
  const KeepWarmScreen({super.key});

  @override
  State<KeepWarmScreen> createState() => _KeepWarmScreenState();
}

class _KeepWarmScreenState extends State<KeepWarmScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //keep_warm
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider =
      Provider.of<KeepingWarmProvider>(context, listen: false);
      provider.fetchKeepingWarmData("motorcycle_alertness", "keep_warm");
      //  provider.fetchAllDocuments("motorcycle_alertness");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Keep Warm", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<KeepingWarmProvider>(
        builder: (context,provider,child) {
          final data = provider.data;

          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data.title),
                buildImage(data.image),
                createAutoSizeText(data.subtitle),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DistractionScreen(), // Replace with your next screen
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
          );
        }
      ),
    );
  }
}
