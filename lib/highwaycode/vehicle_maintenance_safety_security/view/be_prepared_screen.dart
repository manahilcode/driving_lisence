import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/be_prepared_controller.dart';

class BePreparedScreenHighway extends StatefulWidget {
  const BePreparedScreenHighway({super.key});

  @override
  State<BePreparedScreenHighway> createState() => _BePreparedScreenHighwayState();
}

class _BePreparedScreenHighwayState extends State<BePreparedScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayBePreparedProvider>(context, listen: false);
          provider.fetchBePreparedDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Be prepared", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayBePreparedProvider>(
          builder: (context,provider,child) {
            final data = provider.document;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text),
                    Gap(10),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
