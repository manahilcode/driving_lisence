import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_safety/pages/vehicle_safety_7.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/loader.dart';
import '../viewmodel/weather_condition_provider.dart';

class WeatherConditionScreen extends StatefulWidget {
  const WeatherConditionScreen({super.key});

  @override
  State<WeatherConditionScreen> createState() => _WeatherConditionScreenState();
}

class _WeatherConditionScreenState extends State<WeatherConditionScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<WeatherConditionNotifier>(context, listen: false);
      provider.fetchWeatherConditionData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<WeatherConditionNotifier>(
          builder: (context,provider,child) {
            final data = provider.weatherConditionData;
            if(data == null)
            {
              return LoadingScreen();
            }

            return Column(
              children: [
                createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                createAutoSizeText(data.ford),
                createAutoSizeText(data.tip),
                createAutoSizeText(data.reflection),
                
                Column(
                  children: [
                    createAutoSizeText(data.image.text),
                    buildImage(data.image.image),
                  ],
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

                Column(
                  children: [
                    createAutoSizeText(data.image4.text),
                    buildImage(data.image4.image),
                  ],
                ),

                Column(
                  children: [
                    createAutoSizeText(data.image5.text),
                    buildImage(data.image5.image),
                  ],
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Othertype6(), // Replace with your next screen
                      //   ),
                      // );
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
            );
          }
      ),

    );
  }
}
