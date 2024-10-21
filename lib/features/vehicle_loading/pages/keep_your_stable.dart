import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class KeepYourStable extends StatefulWidget {
  const KeepYourStable({super.key});

  @override
  State<KeepYourStable> createState() => _KeepYourStableState();
}

class _KeepYourStableState extends State<KeepYourStable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("keep your car stable"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            createHeadingText("Keeping your car stable"),
            Gap(10),
            createAutoSizeText(
                "Loading your vehicle carefully will help to ensure that you can travel safely, whether your load is passengers, animals, a caravan or simply rubbish for the tip."),
            Gap(10),
            createAutoSizeText(
                "You need to make sure that your vehicle isn’t overloaded. Overloading can seriously affect the vehicle’s handling, especially the steering and braking."),
            Gap(10),
            buildImage("https://via.placeholder.com/400"),

            Gap(10),
            createAutoSizeText(
                "When you’re carrying or towing a heavy load, you may need to make adjustments to your vehicle, such as"),
            Gap(10),
            Container(
              child: Column(
                children: [
                  buildBulletText("increasing the air pressure in the tyres"),
                  buildBulletText("adjusting the aim of the headlights."),
                ],
              ),
            ),
            Gap(10),
            createAutoSizeText(
                "You should load your vehicle carefully to avoid upsetting the vehicle’s stability."),
            Gap(10),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText("Distribute the weight evenly."),
                  buildBulletText(
                      "Make sure that the load is fastened so that it can’t move when you’re cornering or braking."),
                  buildBulletText(
                      "Ensure loads don’t obstruct your view when you’re driving, or stick out where they could be dangerous for other road users."),
                ],
              ),
            ),
            Gap(10),
            createAutoSizeText("Carrying a load on a roof rack"),
            Gap(10),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText("will increase wind resistance"),
                  buildBulletText("may make your vehicle less stable."),

                ],
              ),
            ),
            createAutoSizeText("As the load is exposed to the weather, you may need to cover it to protect it from rain. Specially designed roof boxes are available, which cut down the wind resistance and keep loads secure and dry."),
            Gap(10),
            buildTipWidget("You should inflate your tyres to a higher pressure than normal"),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText("when you’re carrying a heavy load"),
                  buildBulletText("if you’re driving for a long distance on a dual carriageway or motorway at the speed limit for these roads."),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const KeepYourStable()),
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
        ),
      ),
    );
  }
}
