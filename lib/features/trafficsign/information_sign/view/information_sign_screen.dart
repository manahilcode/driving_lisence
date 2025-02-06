// lib/screens/sign_information_sign_screen.dart
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/information_sign_provider.dart';

class SignInformationSignScreen extends StatefulWidget {
  const SignInformationSignScreen({Key? key}) : super(key: key);

  @override
  State<SignInformationSignScreen> createState() => _SignInformationSignScreenState();
}

class _SignInformationSignScreenState extends State<SignInformationSignScreen> {
  @override
  void initState() {
    final trafficSignProvider = Provider.of<SignInformationSignProvider>(context, listen: false);
    trafficSignProvider.fetchSignInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A nice AppBar title.
      appBar: CustomAppBar(title: "Sign Information", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
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
      //   title: const Text("Sign Information"),
      // ),
      body: Consumer<SignInformationSignProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }

          if (provider.signs.isEmpty) {
            return const Center(child: Text("No data found."));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.signs.length,
                  itemBuilder: (context, index) {
                    final sign = provider.signs[index];
                    return Column(
                      children: [
                        Gap(10),
                        createAutoSizeText(sign.title),
                        Gap(10),
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Image.network(sign.imageUrl,fit: BoxFit.fitHeight,),
                         ),
                        Gap(10),


                      ],
                    );

                  },
                ),
              ),
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
