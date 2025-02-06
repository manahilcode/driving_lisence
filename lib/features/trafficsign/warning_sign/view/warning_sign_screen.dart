// lib/screens/sign_warning_sign_screen.dart
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/warning_sign_provider.dart';

class SignWarningSignScreen extends StatefulWidget {
  const SignWarningSignScreen({Key? key}) : super(key: key);

  @override
  State<SignWarningSignScreen> createState() => _SignWarningSignScreenState();
}

class _SignWarningSignScreenState extends State<SignWarningSignScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_){
      final signProvider = Provider.of<SignWarningSignProvider>(context, listen: false);
      signProvider.fetchSignWarningSign();

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Warning Signs", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
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
      //   title: const Text('Warning Signs'),
      // ),
      body: Consumer<SignWarningSignProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }
          if (provider.signWarningSign == null) {
            return const Center(child: Text("No data available."));
          }
          final model = provider.signWarningSign!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(

              children: [
                Column(
                  children: [
                    createAutoSizeText(model.text[0]),
                    Image.network(model.text[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text[2]),
                    Image.network(model.text[3]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text[4]),
                    Image.network(model.text[5]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text[6]),
                    Image.network(model.text[7]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text[8]),
                    Image.network(model.text[9]),
                  ],



                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text[10]),
                    Image.network(model.text[11]),
                  ],

                ),
                Column(
                  children: [
                    createAutoSizeText(model.text[12]),
                    Image.network(model.text[13]),
                  ],



                ),
                Column(
                  children: [
                    createAutoSizeText(model.text[14]),
                    Image.network(model.text[15]),
                  ],



                ),
                Column(
                  children: [
                    createAutoSizeText(model.text[16]),
                    Image.network(model.text[17]),
                  ],



                ),
                Column(
                  children: [
                    createAutoSizeText(model.text[18]),
                    Image.network(model.text[19]),
                  ],
                ),
                ///text1
                ///
                Column(
                  children: [
                    createAutoSizeText(model.text1[0]),
                    Image.network(model.text1[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text1[2]),
                    Image.network(model.text1[3]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text1[4]),
                    Image.network(model.text1[5]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text1[6]),
                    Image.network(model.text1[7]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text1[8]),
                    Image.network(model.text1[9]),
                  ],



                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.text1[10]),
                    Image.network(model.text1[11]),
                  ],

                ),
                Column(
                  children: [
                    createAutoSizeText(model.text1[12]),
                    Image.network(model.text1[13]),
                  ],



                ),
                Column(
                  children: [
                    createAutoSizeText(model.text1[14]),
                    Image.network(model.text1[15]),
                  ],



                ),
                Gap(10),
                //text2
                Column(
                  children: List.generate(model.text2.length, (index) {
                    final item = model.text2[index];
                    // Check if the current index is even.
                    if (index % 2 == 0) {
                      return createAutoSizeText(item);
                    } else {
                      // For odd indexes, display the text.

                      return Image.network(item);
                    }
                  }),
                ),
                Gap(10),
                Gap(10),
                //text3
                Column(
                  children: List.generate(model.text3.length, (index) {
                    final item = model.text3[index];
                    // Check if the current index is even.
                    if (index % 2 == 0) {
                      return createAutoSizeText(item);
                    } else {
                      // For odd indexes, display the text.

                      return Image.network(item);
                    }
                  }),
                ),
                //text4
                Gap(10),
                //text4
                Column(
                  children: List.generate(model.text4.length, (index) {
                    final item = model.text4[index];
                    // Check if the current index is even.
                    if (index % 2 == 0) {
                      return createAutoSizeText(item);
                    } else {
                      // For odd indexes, display the text.

                      return Image.network(item);
                    }
                  }),
                ),
              //  text5
                Gap(10),
                Column(
                  children: List.generate(model.text5.length, (index) {
                    final item = model.text5[index];
                    // Check if the current index is even.
                    if (index % 2 == 0) {
                      return createAutoSizeText(item);
                    } else {
                      // For odd indexes, display the text.

                      return Image.network(item);
                    }
                  }),
                ),
                //  text6
                Gap(10),
                Column(
                  children: List.generate(model.text6.length, (index) {
                    final item = model.text6[index];
                    // Check if the current index is even.
                    if (index % 2 == 0) {
                      return createAutoSizeText(item);
                    } else {
                      // For odd indexes, display the text.

                      return Image.network(item);
                    }
                  }),
                ),
                //  text7
                Gap(10),
                Column(
                  children: List.generate(model.text7.length, (index) {
                    final item = model.text7[index];
                    // Check if the current index is even.
                    if (index % 2 == 0) {
                      return createAutoSizeText(item);
                    } else {
                      // For odd indexes, display the text.

                      return Image.network(item);
                    }
                  }),
                ),



                Gap(10),
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
