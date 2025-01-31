import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/document_controller.dart';

class DocumentScreen2211 extends StatefulWidget {
  const DocumentScreen2211({super.key});

  @override
  State<DocumentScreen2211> createState() => _DocumentScreen2211State();
}

class _DocumentScreen2211State extends State<DocumentScreen2211> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HighwayCodeProvider2211>(context, listen: false);
          provider.fetchDocuments();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Documents", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HighwayCodeProvider2211>(
          builder: (context,provider,child) {
            final data = provider.documents;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.text1),
                    Gap(10),
                    Column(
                      children: data.text.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text2.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text3.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text4.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text5.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text6.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text7.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
                    Gap(10),
                    Column(
                      children: data.text8.map((e)=> createAutoSizeText(e.toString())).toList(),
                    ),
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
