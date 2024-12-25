import 'package:flutter/material.dart';

import '../../../../core/appbar.dart';

class MeetingStandardScreen extends StatefulWidget {
  const MeetingStandardScreen({super.key});

  @override
  State<MeetingStandardScreen> createState() => _MeetingStandardScreenState();
}

class _MeetingStandardScreenState extends State<MeetingStandardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Alertness",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
      body: Consumer(
          builder: (context,provider,child) {
            final data = provider.tunnelSafety;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Column(
              children: [],
            );
          }
      ),
    );
  }
}
