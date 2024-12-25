import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class SecuurityScreen extends StatefulWidget {
  const SecuurityScreen({super.key});

  @override
  State<SecuurityScreen> createState() => _SecuurityScreenState();
}

class _SecuurityScreenState extends State<SecuurityScreen> {
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
