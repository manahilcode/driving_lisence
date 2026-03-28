import 'package:flutter/material.dart';

import '../utils/local_store.dart';
import '../utils/question_bank.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final LocalStore store;

  const QuizPage({
    super.key,
    required this.questions,
    required this.store,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _index = 0;
  int _correct = 0;

  void _answer(int selectedIndex) async {
    final q = widget.questions[_index];
    final isCorrect = selectedIndex == q.correctIndex;

    if (isCorrect) _correct++;

    await widget.store.incrementCompletedCount();

    if (!mounted) return;

    final nextIndex = _index + 1;
    if (nextIndex >= widget.questions.length) {
      await showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Done'),
          content: Text('Score: $_correct / ${widget.questions.length}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
      if (!mounted) return;
      Navigator.of(context).pop();
      return;
    }

    setState(() => _index = nextIndex);
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[_index];
    final progress = (_index + 1) / widget.questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 16),
            Text(
              'Question ${_index + 1} / ${widget.questions.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text(
              q.text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            for (var i = 0; i < q.options.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: FilledButton.tonal(
                  onPressed: () => _answer(i),
                  child: Text(q.options[i]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

