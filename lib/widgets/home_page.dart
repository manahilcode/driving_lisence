import 'package:flutter/material.dart';

import '../utils/local_store.dart';
import '../utils/question_bank.dart';
import 'quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = LocalStore();

  int _completed = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final completed = await _store.getCompletedCount();
    if (!mounted) return;
    setState(() => _completed = completed);
  }

  Future<void> _startQuiz() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuizPage(
          questions: QuestionBank.sampleQuestions,
          store: _store,
        ),
      ),
    );
    await _loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    final total = QuestionBank.sampleQuestions.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driving Licence (Offline)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Offline-first, but simple',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text('Progress: $_completed / $total questions completed'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _startQuiz,
              child: const Text('Start practice quiz'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () async {
                await _store.resetProgress();
                await _loadProgress();
              },
              child: const Text('Reset progress'),
            ),
            const Spacer(),
            const Text(
              'Code is intentionally kept in only two folders:\n'
              '- lib/widgets/\n'
              '- lib/utils/\n',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

