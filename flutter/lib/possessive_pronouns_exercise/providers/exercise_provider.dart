import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/exercise_data.dart';
import '../state/exercise_state.dart';

class ExerciseNotifier extends StateNotifier<ExerciseState> {
  ExerciseNotifier() : super(ExerciseState.initial()) {
    startNewSession();
  }

  final _random = Random();

  void startNewSession() {
    final all = List<Exercise>.from(aiv_learn_german_exercises);
    all.shuffle(_random);
    final sessionQuestions = all.take(15).toList();

    state = ExerciseState(
      sessionQuestions: sessionQuestions,
      currentQuestionIndex: 0,
      score: 0,
      selectedAnswer: null,
      isAnswerSubmitted: false,
    );
  }

  void submitAnswer(String answer) {
    if (state.isAnswerSubmitted) return;

    final isCorrect = state.currentQuestion!.correct_answer == answer;
    state = state.copyWith(
      selectedAnswer: answer,
      isAnswerSubmitted: true,
      score: isCorrect ? state.score + 1 : state.score,
    );
  }

  void nextQuestion() {
    if (state.currentQuestionIndex < state.sessionQuestions.length - 1) {
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        forceSelectedAnswerToNull: true,
        isAnswerSubmitted: false,
      );
    } else {
      // Last question was answered, the UI should now navigate to the results screen.
      // We can signal this by, for example, not changing the state here,
      // and having the UI check if it's the last question.
    }
  }
}

final exerciseProvider = StateNotifierProvider<ExerciseNotifier, ExerciseState>((ref) {
  return ExerciseNotifier();
});
