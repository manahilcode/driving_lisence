import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_handling/pages/windy_weather.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VeryBadWeather extends StatefulWidget {
  const VeryBadWeather({super.key});

  @override
  State<VeryBadWeather> createState() => _VeryBadWeatherState();
}

class _VeryBadWeatherState extends State<VeryBadWeather> {
  IntroductionController? _controller;
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<IntroductionController>(context, listen: false);
    _controller?.getVeryBadWeather();
    return Scaffold(
      appBar: AppBar(
        title: Text("Very Bad Weather"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IntroductionController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.badWeatherModel;
          print(data);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              createHeadingText(data!.title),
              buildImage(data.image),
              createAutoSizeText(data.subtitle),
              createAutoSizeText(data.points[0]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Column(
                    children: [
                      buildBulletText(data.points[1]),
                      buildBulletText(data.points[2]),

                    ],
                  ),
                ),
              ),

              createAutoSizeText(data.subtitle2),
              buildTipWidget(data.tip),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Route newRoute = MaterialPageRoute(builder: (context) => const WindyWeather());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
                  );

                },
                child: Center(
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30.0),
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
            ],
          );
        },
      ),
    );
  }
}
