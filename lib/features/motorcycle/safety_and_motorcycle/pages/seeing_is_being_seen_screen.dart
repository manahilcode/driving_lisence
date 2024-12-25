import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class SeeingIsBeingSeenScreen extends StatefulWidget {
  const SeeingIsBeingSeenScreen({super.key});

  @override
  State<SeeingIsBeingSeenScreen> createState() => _SeeingIsBeingSeenScreenState();
}

class _SeeingIsBeingSeenScreenState extends State<SeeingIsBeingSeenScreen> {
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
