import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class BeingAwareOfEnviromentScreen extends StatefulWidget {
  const BeingAwareOfEnviromentScreen({super.key});

  @override
  State<BeingAwareOfEnviromentScreen> createState() => _BeingAwareOfEnviromentScreenState();
}

class _BeingAwareOfEnviromentScreenState extends State<BeingAwareOfEnviromentScreen> {
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
