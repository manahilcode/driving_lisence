import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../category.dart' as cat;
import '../../../../core/facebook_ads.dart';
import '../../../../menu_screen.dart';

class CorrectWrongQuestion extends StatefulWidget {
  // Store correct questions
  final List<String> correctQuestions;
  // Store wrong questions
  final List<String> wrongAnswers;

  const CorrectWrongQuestion({
    super.key,
    required this.correctQuestions,
    required this.wrongAnswers,
  });

  @override
  State<CorrectWrongQuestion> createState() => _CorrectWrongQuestionState();
}

class _CorrectWrongQuestionState extends State<CorrectWrongQuestion>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  FacebookAdsProvider? _facebookAdsProvider;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 2 tabs (Correct and Wrong)
    _tabController = TabController(length: 2, vsync: this);

  }

  @override
  void didChangeDependencies() {
    _facebookAdsProvider = Provider.of<FacebookAdsProvider>(context,listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Correct & Wrong Answers',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          tabs: const [
            Tab(
              text: 'Correct Answers',
            ),
            Tab(text: 'Wrong Answers'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            // Display Correct Answers
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.correctQuestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(widget.correctQuestions[index]),
                          leading: const Icon(Icons.check_circle,
                              color: Colors.green),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Route newRoute = MaterialPageRoute(
                            builder: (context) => const MenuScreen());

                        Navigator.pushAndRemoveUntil(
                          context,
                          newRoute,
                          (Route<dynamic> route) =>
                              false, // Removes all previous routes
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Go Back",
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Display Wrong Answers
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.wrongAnswers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(widget.wrongAnswers[index]),
                          leading: Icon(Icons.cancel, color: Colors.red),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Route newRoute = MaterialPageRoute(
                            builder: (context) => MenuScreen());

                        Navigator.pushAndRemoveUntil(
                          context,
                          newRoute,
                          (Route<dynamic> route) =>
                              false, // Removes all previous routes
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Go Back",
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: _facebookAdsProvider?.showBannerAd(),
      ),
    );
  }
}
