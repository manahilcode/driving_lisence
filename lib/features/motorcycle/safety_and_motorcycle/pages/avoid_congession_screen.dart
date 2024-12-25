import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class AvoidCongessionScreen extends StatefulWidget {
  const AvoidCongessionScreen({super.key});

  @override
  State<AvoidCongessionScreen> createState() => _AvoidCongessionScreenState();
}

class _AvoidCongessionScreenState extends State<AvoidCongessionScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer(
        builder: (context,provider,child) {
          return Column(
            children: [

            ],
          );
        }
      ),

    );
  }
}
