// lib/screens/sign_system_screen.dart
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/sign_system_provider.dart';

class SignSystemScreen23 extends StatefulWidget {
  const SignSystemScreen23({Key? key}) : super(key: key);

  @override
  State<SignSystemScreen23> createState() => _SignSystemScreen23State();
}

class _SignSystemScreen23State extends State<SignSystemScreen23> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final signProvider =
          Provider.of<SignSystemProvider124>(context, listen: false);
      signProvider.fetchSignSystem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Traffic Sign System",
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
      //   title: const Text('Traffic Sign System'),
      // ),
      body: Consumer<SignSystemProvider124>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }
          if (provider.signSystem == null) {
            return const Center(child: Text("No data available."));
          }

          final model = provider.signSystem!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  model.text,
                  style: const TextStyle(),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    createAutoSizeText(model.text1[0]),
                    Image.network(model.images[0]),
                  ],
                ),
                Column(
                  children: [
                    createAutoSizeText(model.text1[1]),
                    Image.network(model.images[1]),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    createAutoSizeText(model.text1[2]),
                    Image.network(model.images[2]),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    createAutoSizeText(model.text1[3]),
                    Image.network(model.images[3]),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    createAutoSizeText(model.text1[4]),
                    Image.network(model.images[4]),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    createAutoSizeText(model.text1[5]),
                    Image.network(model.images[5]),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    createAutoSizeText(model.text1[6]),
                    Image.network(model.images[6]),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    createAutoSizeText(model.text1[7]),
                    Image.network(model.images[7]),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    createAutoSizeText(model.text1[8]),
                    Image.network(model.images[8]),
                  ],
                ),
                const SizedBox(height: 20),
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
