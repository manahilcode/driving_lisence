import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../viewmodel/documents_controller.dart';

class DocumentsScreenHighway11 extends StatefulWidget {
  const DocumentsScreenHighway11({super.key});

  @override
  State<DocumentsScreenHighway11> createState() => _DocumentsScreenHighway11State();
}

class _DocumentsScreenHighway11State extends State<DocumentsScreenHighway11> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayDocumentProvider11>(context, listen: false);
          provider.fetchHighwayDocument();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Documents", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayDocumentProvider11>(
          builder: (context,provider,child) {
            final data = provider.highwayDocument;
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
                    createAutoSizeText(data.text2),
                    Gap(10),
                    createAutoSizeText(data.text3),
                    Gap(10),
                    createAutoSizeText(data.text4),
                    Gap(10),
                    createAutoSizeText(data.text5),
                    Gap(10),
                    createAutoSizeText(data.text6),
                    Gap(10),
                    createAutoSizeText(data.text7),
                    Gap(10),
                    createAutoSizeText(data.text8),
                    Gap(10),
                    createAutoSizeText(data.text9),
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
