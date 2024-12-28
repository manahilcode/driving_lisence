import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/safety_and_motorcycle/pages/parking_safety_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/security_provider.dart';

class SecuurityScreen extends StatefulWidget {
  const SecuurityScreen({super.key});

  @override
  State<SecuurityScreen> createState() => _SecuurityScreenState();
}

class _SecuurityScreenState extends State<SecuurityScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SecurityNotifier>(context, listen: false);
      provider.fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "security", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<SecurityNotifier>(
          builder: (context,provider,child) {
            final data = provider.securityData;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createHeadingText(data.title),
                    createAutoSizeText(data.subtitle),
                    createAutoSizeText(data.subtitle1),
                    Column(
                      children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                    ),
                
                    Column(
                      children: [
                        createAutoSizeText(data.image1.text),
                        buildImage(data.image1.image),
                      ],
                    ),
                    Column(
                      children: [
                        createAutoSizeText(data.image2.text),
                        buildImage(data.image2.image),
                      ],
                    ),
                    Column(
                      children: [
                        createAutoSizeText(data.image3.text),
                        buildImage(data.image3.image),
                      ],
                    ),
                
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ParkingSafetyScreen(), // Replace with your next screen
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
          }
      ),

    );

  }
}
