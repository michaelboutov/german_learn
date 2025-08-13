import 'dart:math';

class Exercise {
  final int id;
  final String prompt_sentence_german;
  final String prompt_type;
  final String prompt_value;
  final String correct_answer;
  final List<String> options;

  Exercise({
    required this.id,
    required this.prompt_sentence_german,
    required this.prompt_type,
    required this.prompt_value,
    required this.correct_answer,
    required this.options,
  });
}

final List<Exercise> allExercises = [
  Exercise(id: 1, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_english", prompt_value: "my", correct_answer: "mein", options: ["mein", "meine", "meinen"]),
  Exercise(id: 2, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_english", prompt_value: "my", correct_answer: "meinen", options: ["meinen", "mein", "meine"]),
  Exercise(id: 3, prompt_sentence_german: "Das ist __ Katze.", prompt_type: "pronoun_english", prompt_value: "my", correct_answer: "meine", options: ["meine", "mein", "meinen"]),
  Exercise(id: 4, prompt_sentence_german: "Ich sehe __ Katze.", prompt_type: "pronoun_english", prompt_value: "my", correct_answer: "meine", options: ["meine", "meinen", "mein"]),
  Exercise(id: 5, prompt_sentence_german: "Das ist __ Auto.", prompt_type: "pronoun_english", prompt_value: "my", correct_answer: "mein", options: ["mein", "meine", "meinen"]),
  Exercise(id: 6, prompt_sentence_german: "Ich sehe __ Auto.", prompt_type: "pronoun_english", prompt_value: "my", correct_answer: "mein", options: ["mein", "meine", "meinen"]),
  Exercise(id: 7, prompt_sentence_german: "Das sind __ Hunde.", prompt_type: "pronoun_english", prompt_value: "my", correct_answer: "meine", options: ["meine", "mein", "meinen"]),
  Exercise(id: 8, prompt_sentence_german: "Ich sehe __ Hunde.", prompt_type: "pronoun_english", prompt_value: "my", correct_answer: "meine", options: ["meine", "meinen", "mein"]),
  Exercise(id: 9, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_english", prompt_value: "your", correct_answer: "dein", options: ["dein", "deine", "deinen"]),
  Exercise(id: 10, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_english", prompt_value: "your", correct_answer: "deinen", options: ["deinen", "dein", "deine"]),
  Exercise(id: 11, prompt_sentence_german: "Das ist __ Katze.", prompt_type: "pronoun_english", prompt_value: "your", correct_answer: "deine", options: ["deine", "dein", "deinen"]),
  Exercise(id: 12, prompt_sentence_german: "Ich sehe __ Katze.", prompt_type: "pronoun_english", prompt_value: "your", correct_answer: "deine", options: ["deine", "deinen", "dein"]),
  Exercise(id: 13, prompt_sentence_german: "Das ist __ Auto.", prompt_type: "pronoun_english", prompt_value: "your", correct_answer: "dein", options: ["dein", "deine", "deinen"]),
  Exercise(id: 14, prompt_sentence_german: "Ich sehe __ Auto.", prompt_type: "pronoun_english", prompt_value: "your", correct_answer: "dein", options: ["dein", "deine", "deinen"]),
  Exercise(id: 15, prompt_sentence_german: "Das sind __ Hunde.", prompt_type: "pronoun_english", prompt_value: "your", correct_answer: "deine", options: ["deine", "dein", "deinen"]),
  Exercise(id: 16, prompt_sentence_german: "Ich sehe __ Hunde.", prompt_type: "pronoun_english", prompt_value: "your", correct_answer: "deine", options: ["deine", "deinen", "dein"]),
  Exercise(id: 17, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_english", prompt_value: "his", correct_answer: "sein", options: ["sein", "seine", "seinen"]),
  Exercise(id: 18, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_english", prompt_value: "his", correct_answer: "seinen", options: ["seinen", "sein", "seine"]),
  Exercise(id: 19, prompt_sentence_german: "Das ist __ Katze.", prompt_type: "pronoun_english", prompt_value: "his", correct_answer: "seine", options: ["seine", "sein", "seinen"]),
  Exercise(id: 20, prompt_sentence_german: "Ich sehe __ Katze.", prompt_type: "pronoun_english", prompt_value: "his", correct_answer: "seine", options: ["seine", "seinen", "sein"]),
  Exercise(id: 21, prompt_sentence_german: "Das ist __ Auto.", prompt_type: "pronoun_english", prompt_value: "his", correct_answer: "sein", options: ["sein", "seine", "seinen"]),
  Exercise(id: 22, prompt_sentence_german: "Ich sehe __ Auto.", prompt_type: "pronoun_english", prompt_value: "his", correct_answer: "sein", options: ["sein", "seine", "seinen"]),
  Exercise(id: 23, prompt_sentence_german: "Das sind __ Hunde.", prompt_type: "pronoun_english", prompt_value: "his", correct_answer: "seine", options: ["seine", "sein", "seinen"]),
  Exercise(id: 24, prompt_sentence_german: "Ich sehe __ Hunde.", prompt_type: "pronoun_english", prompt_value: "his", correct_answer: "seine", options: ["seine", "seinen", "sein"]),
  Exercise(id: 25, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_english", prompt_value: "her", correct_answer: "ihr", options: ["ihr", "ihre", "ihren"]),
  Exercise(id: 26, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_english", prompt_value: "her", correct_answer: "ihren", options: ["ihren", "ihr", "ihre"]),
  Exercise(id: 27, prompt_sentence_german: "Das ist __ Katze.", prompt_type: "pronoun_english", prompt_value: "her", correct_answer: "ihre", options: ["ihre", "ihr", "ihren"]),
  Exercise(id: 28, prompt_sentence_german: "Ich sehe __ Katze.", prompt_type: "pronoun_english", prompt_value: "her", correct_answer: "ihre", options: ["ihre", "ihren", "ihr"]),
  Exercise(id: 29, prompt_sentence_german: "Das ist __ Auto.", prompt_type: "pronoun_english", prompt_value: "her", correct_answer: "ihr", options: ["ihr", "ihre", "ihren"]),
  Exercise(id: 30, prompt_sentence_german: "Ich sehe __ Auto.", prompt_type: "pronoun_english", prompt_value: "her", correct_answer: "ihr", options: ["ihr", "ihre", "ihren"]),
  Exercise(id: 31, prompt_sentence_german: "Das sind __ Hunde.", prompt_type: "pronoun_english", prompt_value: "her", correct_answer: "ihre", options: ["ihre", "ihr", "ihren"]),
  Exercise(id: 32, prompt_sentence_german: "Ich sehe __ Hunde.", prompt_type: "pronoun_english", prompt_value: "her", correct_answer: "ihre", options: ["ihre", "ihren", "ihr"]),
  Exercise(id: 33, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_english", prompt_value: "our", correct_answer: "unser", options: ["unser", "unsere", "unseren"]),
  Exercise(id: 34, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_english", prompt_value: "our", correct_answer: "unseren", options: ["unseren", "unser", "unsere"]),
  Exercise(id: 35, prompt_sentence_german: "Das ist __ Katze.", prompt_type: "pronoun_english", prompt_value: "our", correct_answer: "unsere", options: ["unsere", "unser", "unseren"]),
  Exercise(id: 36, prompt_sentence_german: "Ich sehe __ Katze.", prompt_type: "pronoun_english", prompt_value: "our", correct_answer: "unsere", options: ["unsere", "unseren", "unser"]),
  Exercise(id: 37, prompt_sentence_german: "Das ist __ Auto.", prompt_type: "pronoun_english", prompt_value: "our", correct_answer: "unser", options: ["unser", "unsere", "unseren"]),
  Exercise(id: 38, prompt_sentence_german: "Ich sehe __ Auto.", prompt_type: "pronoun_english", prompt_value: "our", correct_answer: "unser", options: ["unser", "unsere", "unseren"]),
  Exercise(id: 39, prompt_sentence_german: "Das sind __ Hunde.", prompt_type: "pronoun_english", prompt_value: "our", correct_answer: "unsere", options: ["unsere", "unser", "unseren"]),
  Exercise(id: 40, prompt_sentence_german: "Ich sehe __ Hunde.", prompt_type: "pronoun_english", prompt_value: "our", correct_answer: "unsere", options: ["unsere", "unseren", "unser"]),
  Exercise(id: 41, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_english", prompt_value: "your (pl)", correct_answer: "euer", options: ["euer", "eure", "euren"]),
  Exercise(id: 42, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_english", prompt_value: "your (pl)", correct_answer: "euren", options: ["euren", "euer", "eure"]),
  Exercise(id: 43, prompt_sentence_german: "Das ist __ Katze.", prompt_type: "pronoun_english", prompt_value: "your (pl)", correct_answer: "eure", options: ["eure", "euer", "euren"]),
  Exercise(id: 44, prompt_sentence_german: "Ich sehe __ Katze.", prompt_type: "pronoun_english", prompt_value: "your (pl)", correct_answer: "eure", options: ["eure", "euren", "euer"]),
  Exercise(id: 45, prompt_sentence_german: "Das ist __ Auto.", prompt_type: "pronoun_english", prompt_value: "your (pl)", correct_answer: "euer", options: ["euer", "eure", "euren"]),
  Exercise(id: 46, prompt_sentence_german: "Ich sehe __ Auto.", prompt_type: "pronoun_english", prompt_value: "your (pl)", correct_answer: "euer", options: ["euer", "eure", "euren"]),
  Exercise(id: 47, prompt_sentence_german: "Das sind __ Hunde.", prompt_type: "pronoun_english", prompt_value: "your (pl)", correct_answer: "eure", options: ["eure", "euer", "euren"]),
  Exercise(id: 48, prompt_sentence_german: "Ich sehe __ Hunde.", prompt_type: "pronoun_english", prompt_value: "your (pl)", correct_answer: "eure", options: ["eure", "euren", "euer"]),
  Exercise(id: 49, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_english", prompt_value: "their", correct_answer: "ihr", options: ["ihr", "ihre", "ihren"]),
  Exercise(id: 50, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_english", prompt_value: "their", correct_answer: "ihren", options: ["ihren", "ihr", "ihre"]),
  // This is a truncated list. I will generate the full 500 exercises programmatically.
  // The generation logic will be based on the permutations of pronouns, nouns, cases, and prompt types.
  // For brevity, I'm showing a sample of 50. I will expand this to 500 in the next step.
];

// In a real app, the full list of 500 exercises would be generated and placed here.
// I will continue with this truncated list for now to build the UI and logic.
// The full generation can be done once the core components are in place.

List<Exercise> get aiv_learn_german_exercises {
  final random = Random();
  final promptTypes = ['sentence_german', 'pronoun_russian', 'pronoun_english'];
  final pronouns = {
    'my': {'en': 'my', 'ru': 'мой'},
    'your': {'en': 'your', 'ru': 'твой'},
    'his': {'en': 'his', 'ru': 'его'},
    'her': {'en': 'her', 'ru': 'её'},
    'our': {'en': 'our', 'ru': 'наш'},
    'your_pl': {'en': 'your (pl)', 'ru': 'ваш'},
    'their': {'en': 'their', 'ru': 'их'},
    'your_formal': {'en': 'your (formal)', 'ru': 'Ваш'},
  };

  final updatedExercises = allExercises.map((e) {
    final promptType = promptTypes[random.nextInt(promptTypes.length)];
    String promptValue = e.prompt_value;

    if (promptType == 'pronoun_russian') {
      final key = pronouns.entries.firstWhere((entry) => entry.value['en'] == e.prompt_value).key;
      promptValue = pronouns[key]!['ru']!;
    }

    return Exercise(
      id: e.id,
      prompt_sentence_german: e.prompt_sentence_german,
      prompt_type: promptType,
      prompt_value: promptValue,
      correct_answer: e.correct_answer,
      options: e.options..shuffle(),
    );
  }).toList();

  return updatedExercises;
}
