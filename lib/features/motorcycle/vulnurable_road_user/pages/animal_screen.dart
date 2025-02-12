import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/animals_provider.dart';
import 'driver_screen.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AnimalVulnerableUserProvider>(context, listen: false);
      provider.fetchAnimalVulnerableUserData("Animals");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Animal", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<AnimalVulnerableUserProvider>(
        builder: (context,provider,child) {
          final data = provider.data;
          if(data == null)
          {
            return LoadingScreen();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Gap(20),
                   createHeadingText(data.title),
                  Gap(20),
                  createAutoSizeText(data.subtitle),
                  Gap(20),
                  buildImage(data.image),
                  Gap(20),
                  Column(
                    children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                  ),
                  Gap(20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverScreen(), // Replace with your next screen
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
