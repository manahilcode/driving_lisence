import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class DealingWithFualtScreen extends StatefulWidget {
  const DealingWithFualtScreen({super.key});

  @override
  State<DealingWithFualtScreen> createState() => _DealingWithFualtScreenState();
}

class _DealingWithFualtScreenState extends State<DealingWithFualtScreen> {
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
