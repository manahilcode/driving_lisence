import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../repo/avoiding_congession_repo.dart';
import '../viewmodel/avoid_congession_provider.dart';

class AvoidCongessionScreen extends StatefulWidget {
  const AvoidCongessionScreen({super.key});

  @override
  State<AvoidCongessionScreen> createState() => _AvoidCongessionScreenState();
}

class _AvoidCongessionScreenState extends State<AvoidCongessionScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BreakdownProvider>(context, listen: false);
      provider.fetchBreakdown("Animals_on_the_road");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<AvoidingCongestionNotifier>(
        builder: (context,provider,child) {
          final data = provider.data;
          if(data == null)
            {
              return LoadingScreen();
            }

          return Column(
            children: [
              createHeadingText(data.title),
              createAutoSizeText(data.subtitle),
              buildImage(data.image),
              createAutoSizeText(data.subtitle1),
              buildTipWidget(data.tip),
              buildTipWidget(data.tip1),
              Column(
                children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
              ),
              Column(
                children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
              ),
              Column(
                children: data.points2.map((e)=>buildBulletText(e.toString())).toList(),
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
