import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class DiscussWithTrainerScreen extends StatefulWidget {
  const DiscussWithTrainerScreen({super.key});

  @override
  State<DiscussWithTrainerScreen> createState() => _DiscussWithTrainerScreenState();
}

class _DiscussWithTrainerScreenState extends State<DiscussWithTrainerScreen> {
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
