import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/exercise_data.dart';
import '../providers/exercise_provider.dart';
import '../state/exercise_state.dart';
import 'results_screen.dart'; // We will create this screen next

class ExerciseScreen extends ConsumerStatefulWidget {
  const ExerciseScreen({super.key});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends ConsumerState<ExerciseScreen> with TickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _shakeController,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _onAnswerSubmitted(String answer, ExerciseState state) {
    final notifier = ref.read(exerciseProvider.notifier);
    notifier.submitAnswer(answer);

    final isCorrect = state.currentQuestion!.correct_answer == answer;
    if (!isCorrect) {
      _shakeController.forward(from: 0);
    }
  }

  String _getPromptText(Exercise question) {
    if (question.prompt_type == 'sentence_german') {
      return question.prompt_sentence_german;
    }
    return question.prompt_value;
  }

  void _onNextQuestion(ExerciseState state) {
    if (state.currentQuestionIndex < state.sessionQuestions.length - 1) {
      ref.read(exerciseProvider.notifier).nextQuestion();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            score: state.score,
            totalQuestions: state.sessionQuestions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exerciseProvider);
    final question = state.currentQuestion;

    if (question == null) {
      return const Scaffold(
        backgroundColor: Color(0xFF1A1A1A),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question: ${state.currentQuestionIndex + 1}/${state.sessionQuestions.length}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Score: ${state.score}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_shakeAnimation.value * 10, 0),
                  child: child,
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: const [BoxShadow(color: Colors.white, offset: Offset(4, 4), blurRadius: 0)],
                ),
                child: Text(
                  _getPromptText(state.currentQuestion!),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 2.5,
              ),
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                final option = question.options[index];
                Color color = Colors.grey[700]!;
                if (state.isAnswerSubmitted) {
                  if (option == state.currentQuestion!.correct_answer) {
                    color = const Color(0xFF00FF00); // Green
                  } else if (option == state.selectedAnswer) {
                    color = const Color(0xFFFF0000); // Red
                  }
                }

                return GestureDetector(
                  onTap: state.isAnswerSubmitted ? null : () => _onAnswerSubmitted(option, state),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: const [BoxShadow(color: Colors.white, offset: Offset(4, 4), blurRadius: 0)],
                    ),
                    child: Center(
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
            if (state.isAnswerSubmitted)
              GestureDetector(
                onTap: () => _onNextQuestion(state),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [BoxShadow(color: Colors.white, offset: Offset(4, 4), blurRadius: 0)],
                  ),
                  child: const Text('Next Question', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                ),
              )
            else
              Container(height: 60),
          ],
        ),
      ),
    );
  }
}
