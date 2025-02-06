// lib/screens/sign_giving_orders_screen.dart
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/trafficsign/sign_giving_order/model/giving_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/giving_order_provider.dart';

class SignGivingOrdersScreen extends StatefulWidget {
  const SignGivingOrdersScreen({Key? key}) : super(key: key);

  @override
  State<SignGivingOrdersScreen> createState() => _SignGivingOrdersScreenState();
}

class _SignGivingOrdersScreenState extends State<SignGivingOrdersScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_){
      final signProvider = Provider.of<SignGivingOrdersProvider>(context, listen: false);
      signProvider.fetchSignGivingOrders();

    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Sign Giving Orders", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
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
      //   title: const Text('Sign Giving Orders'),
      // ),
      body: Consumer<SignGivingOrdersProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }
          if (provider.signGivingOrders == null) {
            return const Center(child: Text("No data available."));
          }
          final model = provider.signGivingOrders!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(

              children: [
                Column(
                  children: [
                    createAutoSizeText(model.data[0]),
                    Image.network(model.data[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.data1[0]),
                    Image.network(model.data1[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.data2[0]),
                    Image.network(model.data2[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.data3[0]),
                    Image.network(model.data3[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.data4[0]),
                    Image.network(model.data4[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign[0]),
                    Image.network(model.sign[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign1[0]),
                    Image.network(model.sign1[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign2[0]),
                    Image.network(model.sign2[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign3[0]),
                    Image.network(model.sign3[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign4[0]),
                    Image.network(model.sign4[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign5[0]),
                    Image.network(model.sign5[1]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign5[2]),
                    Image.network(model.sign5[3]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign5[4]),
                    Image.network(model.sign5[5]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign5[6]),
                    Image.network(model.sign5[7]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign5[8]),
                    Image.network(model.sign5[9]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign5[10]),
                    Image.network(model.sign5[11]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign5[12]),
                    Image.network(model.sign5[13]),
                  ],
                ),
                Gap(10),
                Column(
                  children: [
                    createAutoSizeText(model.sign5[14]),
                    Image.network(model.sign5[15]),
                  ],
                ),
                Gap(10),

                const SizedBox(height: 16),
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
