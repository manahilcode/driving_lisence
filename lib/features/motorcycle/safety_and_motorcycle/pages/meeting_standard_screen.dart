import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer(
          builder: (context,provider,child) {
            return Column(
              children: [],
            );
          }
      ),

    );
  }
}
