import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/essential_document/pages/your_driver_licence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class RegisteringOwningCar extends StatefulWidget {
  const RegisteringOwningCar({super.key});

  @override
  State<RegisteringOwningCar> createState() => _RegisteringOwningCarState();
}

class _RegisteringOwningCarState extends State<RegisteringOwningCar> {
  EssentialDocumentsController? _essentialDocumentsController;

  @override
  void didChangeDependencies() {
    _essentialDocumentsController =
        Provider.of<EssentialDocumentsController>(context, listen: false);
    _essentialDocumentsController
        ?.fetchRegisteringAndOwningCar("registering_and_owningcar");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registering and Owning Car",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<EssentialDocumentsController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.registeringAndOwningCar;
          if (data == null) {
            return LoadingScreen();
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data.title),
                buildImage(data.image),
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
                        buildBulletText(data.points[3]),
                        buildBulletText(data.points[4]),
                        buildBulletText(data.points[5]),
                        buildBulletText(data.points[6]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(builder: (context) =>  const YourDrivingLicence());

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
            ),
          );
        },
      ),
    );
  }
}
