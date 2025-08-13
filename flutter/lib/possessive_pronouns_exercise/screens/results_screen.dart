import 'package:flutter/material.dart';
import 'exercise_screen.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You scored',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '$score / $totalQuestions',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ExerciseScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(4, 4),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Start a New Session',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
