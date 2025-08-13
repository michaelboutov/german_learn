import 'package:flutter/foundation.dart';
import '../data/exercise_data.dart';

@immutable
class ExerciseState {
  final List<Exercise> sessionQuestions;
  final int currentQuestionIndex;
  final int score;
  final String? selectedAnswer;
  final bool isAnswerSubmitted;

  const ExerciseState({
    required this.sessionQuestions,
    required this.currentQuestionIndex,
    required this.score,
    this.selectedAnswer,
    required this.isAnswerSubmitted,
  });

  factory ExerciseState.initial() {
    // The actual session questions will be loaded by the notifier.
    return const ExerciseState(
      sessionQuestions: [],
      currentQuestionIndex: 0,
      score: 0,
      selectedAnswer: null,
      isAnswerSubmitted: false,
    );
  }

  ExerciseState copyWith({
    List<Exercise>? sessionQuestions,
    int? currentQuestionIndex,
    int? score,
    // A way to explicitly set selectedAnswer to null
    bool forceSelectedAnswerToNull = false,
    String? selectedAnswer,
    bool? isAnswerSubmitted,
  }) {
    return ExerciseState(
      sessionQuestions: sessionQuestions ?? this.sessionQuestions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      score: score ?? this.score,
      selectedAnswer: forceSelectedAnswerToNull ? null : selectedAnswer ?? this.selectedAnswer,
      isAnswerSubmitted: isAnswerSubmitted ?? this.isAnswerSubmitted,
    );
  }

  // Helper getter for the current question
  Exercise? get currentQuestion {
    if (sessionQuestions.isEmpty || currentQuestionIndex >= sessionQuestions.length) {
      return null;
    }
    return sessionQuestions[currentQuestionIndex];
  }
}
