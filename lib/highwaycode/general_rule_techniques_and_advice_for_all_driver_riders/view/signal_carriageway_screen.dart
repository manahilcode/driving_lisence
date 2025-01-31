import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/signal_carriageway_controller.dart';

class SignalCarriagewayScreenHighway  extends StatefulWidget {
  const SignalCarriagewayScreenHighway ({super.key});

  @override
  State<SignalCarriagewayScreenHighway > createState() => _SignalCarriagewayScreenHighwayState();
}

class _SignalCarriagewayScreenHighwayState extends State<SignalCarriagewayScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<SignalCarriagewayProvider>(context, listen: false);
          provider.fetchSignalCarriageway("Single carriageway");
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "signal carriageway", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<SignalCarriagewayProvider>(
          builder: (context,provider,child) {
            final data = provider.signalCarriageway;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: data.points.map((e)=> buildBulletText(e.toString())).toList(),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
