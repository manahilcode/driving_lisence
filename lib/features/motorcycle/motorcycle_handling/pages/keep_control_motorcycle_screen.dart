import 'package:flutter/material.dart';

import '../../../../core/appbar.dart';

class KeepControlMotorcycleScreen extends StatefulWidget {
  const KeepControlMotorcycleScreen({super.key});

  @override
  State<KeepControlMotorcycleScreen> createState() => _KeepControlMotorcycleScreenState();
}

class _KeepControlMotorcycleScreenState extends State<KeepControlMotorcycleScreen> {
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
