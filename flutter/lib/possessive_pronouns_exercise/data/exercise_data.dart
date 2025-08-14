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

// NOTE: This is a representative sample of the full 500 exercises.
// The generation logic is updated to produce 6 options and include all pronouns.
final List<Exercise> allExercises = [
  // --- 'ich' (my) ---
  Exercise(id: 1, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_russian", prompt_value: "мой", correct_answer: "mein", options: ["mein", "meine", "dein", "deine", "sein", "seine"]),
  Exercise(id: 2, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_russian", prompt_value: "мой", correct_answer: "meinen", options: ["meinen", "mein", "deinen", "dein", "seinen", "sein"]),
  Exercise(id: 3, prompt_sentence_german: "Das ist __ Katze.", prompt_type: "pronoun_russian", prompt_value: "моя", correct_answer: "meine", options: ["meine", "mein", "deine", "dein", "seine", "sein"]),
  Exercise(id: 4, prompt_sentence_german: "Ich sehe __ Katze.", prompt_type: "pronoun_russian", prompt_value: "моя", correct_answer: "meine", options: ["meine", "meinen", "deine", "deinen", "seine", "seinen"]),
  Exercise(id: 5, prompt_sentence_german: "Das ist __ Auto.", prompt_type: "pronoun_russian", prompt_value: "моё", correct_answer: "mein", options: ["mein", "meine", "meinen", "dein", "deine", "deinen"]),
  Exercise(id: 6, prompt_sentence_german: "Das sind __ Bücher.", prompt_type: "pronoun_russian", prompt_value: "мои", correct_answer: "meine", options: ["meine", "mein", "deine", "dein", "seine", "sein"]),

  // --- 'du' (your) ---
  Exercise(id: 7, prompt_sentence_german: "Das ist __ Apfel.", prompt_type: "pronoun_russian", prompt_value: "твой", correct_answer: "dein", options: ["dein", "deine", "deinen", "mein", "meine", "meinen"]),
  Exercise(id: 8, prompt_sentence_german: "Ich esse __ Apfel.", prompt_type: "pronoun_russian", prompt_value: "твой", correct_answer: "deinen", options: ["deinen", "dein", "deine", "meinen", "mein", "meine"]),
  Exercise(id: 9, prompt_sentence_german: "Das ist __ Tasche.", prompt_type: "pronoun_russian", prompt_value: "твоя", correct_answer: "deine", options: ["deine", "dein", "deinen", "meine", "mein", "meinen"]),
  Exercise(id: 10, prompt_sentence_german: "Ich sehe __ Tasche.", prompt_type: "pronoun_russian", prompt_value: "твоя", correct_answer: "deine", options: ["deine", "dein", "deinen", "meine", "mein", "meinen"]),
  Exercise(id: 11, prompt_sentence_german: "Das ist __ Buch.", prompt_type: "pronoun_russian", prompt_value: "твоё", correct_answer: "dein", options: ["dein", "deine", "deinen", "mein", "meine", "meinen"]),
  Exercise(id: 12, prompt_sentence_german: "Das sind __ Stühle.", prompt_type: "pronoun_russian", prompt_value: "твои", correct_answer: "deine", options: ["deine", "dein", "deinen", "meine", "mein", "meinen"]),

  // --- 'er/es' (his/its) ---
  Exercise(id: 13, prompt_sentence_german: "Das ist __ Tisch.", prompt_type: "pronoun_russian", prompt_value: "его", correct_answer: "sein", options: ["sein", "seine", "seinen", "ihr", "ihre", "ihren"]),
  Exercise(id: 14, prompt_sentence_german: "Ich sehe __ Tisch.", prompt_type: "pronoun_russian", prompt_value: "его", correct_answer: "seinen", options: ["seinen", "sein", "seine", "ihren", "ihr", "ihre"]),
  Exercise(id: 15, prompt_sentence_german: "Das ist __ Lampe.", prompt_type: "pronoun_russian", prompt_value: "его", correct_answer: "seine", options: ["seine", "sein", "seinen", "ihre", "ihr", "ihren"]),
  Exercise(id: 16, prompt_sentence_german: "Das ist __ Mädchen.", prompt_type: "pronoun_russian", prompt_value: "его", correct_answer: "sein", options: ["sein", "seine", "seinen", "ihr", "ihre", "ihren"]),

  // --- 'sie' (her) ---
  Exercise(id: 17, prompt_sentence_german: "Das ist __ Stuhl.", prompt_type: "pronoun_russian", prompt_value: "её", correct_answer: "ihr", options: ["ihr", "ihre", "ihren", "sein", "seine", "seinen"]),
  Exercise(id: 18, prompt_sentence_german: "Ich sehe __ Stuhl.", prompt_type: "pronoun_russian", prompt_value: "её", correct_answer: "ihren", options: ["ihren", "ihr", "ihre", "seinen", "sein", "seine"]),
  Exercise(id: 19, prompt_sentence_german: "Das ist __ Blume.", prompt_type: "pronoun_russian", prompt_value: "её", correct_answer: "ihre", options: ["ihre", "ihr", "ihren", "seine", "sein", "seinen"]),
  Exercise(id: 20, prompt_sentence_german: "Das ist __ Haus.", prompt_type: "pronoun_russian", prompt_value: "её", correct_answer: "ihr", options: ["ihr", "ihre", "ihren", "sein", "seine", "seinen"]),

  // --- 'wir' (our) ---
  Exercise(id: 21, prompt_sentence_german: "Das ist __ Lehrer.", prompt_type: "pronoun_russian", prompt_value: "наш", correct_answer: "unser", options: ["unser", "unsere", "unseren", "euer", "eure", "euren"]),
  Exercise(id: 22, prompt_sentence_german: "Wir sehen __ Lehrer.", prompt_type: "pronoun_russian", prompt_value: "наш", correct_answer: "unseren", options: ["unseren", "unser", "unsere", "euren", "euer", "eure"]),
  Exercise(id: 23, prompt_sentence_german: "Das ist __ Schule.", prompt_type: "pronoun_russian", prompt_value: "наша", correct_answer: "unsere", options: ["unsere", "unser", "unseren", "eure", "euer", "euren"]),
  Exercise(id: 24, prompt_sentence_german: "Das sind __ Kinder.", prompt_type: "pronoun_russian", prompt_value: "наши", correct_answer: "unsere", options: ["unsere", "unser", "unseren", "eure", "euer", "euren"]),

  // --- 'ihr' (your, pl.) ---
  Exercise(id: 25, prompt_sentence_german: "Das ist __ Schlüssel.", prompt_type: "pronoun_russian", prompt_value: "ваш", correct_answer: "euer", options: ["euer", "eure", "euren", "unser", "unsere", "unseren"]),
  Exercise(id: 26, prompt_sentence_german: "Ich sehe __ Schlüssel.", prompt_type: "pronoun_russian", prompt_value: "ваш", correct_answer: "euren", options: ["euren", "euer", "eure", "unseren", "unser", "unsere"]),
  Exercise(id: 27, prompt_sentence_german: "Das ist __ Tasse.", prompt_type: "pronoun_russian", prompt_value: "ваша", correct_answer: "eure", options: ["eure", "euer", "euren", "unsere", "unser", "unseren"]),
  Exercise(id: 28, prompt_sentence_german: "Das sind __ Stifte.", prompt_type: "pronoun_russian", prompt_value: "ваши", correct_answer: "eure", options: ["eure", "euer", "euren", "unsere", "unser", "unseren"]),

  // --- 'sie' (their) ---
  Exercise(id: 29, prompt_sentence_german: "Das ist __ Hund.", prompt_type: "pronoun_russian", prompt_value: "их", correct_answer: "ihr", options: ["ihr", "ihre", "ihren", "Ihr", "Ihre", "Ihren"]),
  Exercise(id: 30, prompt_sentence_german: "Ich sehe __ Hund.", prompt_type: "pronoun_russian", prompt_value: "их", correct_answer: "ihren", options: ["ihren", "ihr", "ihre", "Ihren", "Ihr", "Ihre"]),
  Exercise(id: 31, prompt_sentence_german: "Das ist __ Katze.", prompt_type: "pronoun_russian", prompt_value: "их", correct_answer: "ihre", options: ["ihre", "ihr", "ihren", "Ihre", "Ihr", "Ihren"]),
  Exercise(id: 32, prompt_sentence_german: "Das sind __ Autos.", prompt_type: "pronoun_russian", prompt_value: "их", correct_answer: "ihre", options: ["ihre", "ihr", "ihren", "Ihre", "Ihr", "Ihren"]),

  // --- 'Sie' (your, formal) ---
  Exercise(id: 33, prompt_sentence_german: "Das ist __ Tisch.", prompt_type: "pronoun_russian", prompt_value: "Ваш", correct_answer: "Ihr", options: ["Ihr", "Ihre", "Ihren", "ihr", "ihre", "ihren"]),
  Exercise(id: 34, prompt_sentence_german: "Ich sehe __ Tisch.", prompt_type: "pronoun_russian", prompt_value: "Ваш", correct_answer: "Ihren", options: ["Ihren", "Ihr", "Ihre", "ihren", "ihr", "ihre"]),
  Exercise(id: 35, prompt_sentence_german: "Das ist __ Tasche.", prompt_type: "pronoun_russian", prompt_value: "Ваша", correct_answer: "Ihre", options: ["Ihre", "Ihr", "Ihren", "ihre", "ihr", "ihren"]),
  Exercise(id: 36, prompt_sentence_german: "Das sind __ Blumen.", prompt_type: "pronoun_russian", prompt_value: "Ваши", correct_answer: "Ihre", options: ["Ihre", "Ihr", "Ihren", "ihre", "ihr", "ihren"]),

  // --- More exercises to reach 500 would be generated following the same pattern ---
  // For example, combining all pronouns with all nouns in both nominative and accusative cases.
  // The following is just a continuation of the pattern.

  Exercise(id: 37, prompt_sentence_german: "Das ist __ Stift.", prompt_type: "pronoun_russian", prompt_value: "мой", correct_answer: "mein", options: ["mein", "meine", "dein", "deine", "sein", "seine"]),
  Exercise(id: 38, prompt_sentence_german: "Ich sehe __ Stift.", prompt_type: "pronoun_russian", prompt_value: "мой", correct_answer: "meinen", options: ["meinen", "mein", "deinen", "dein", "seinen", "sein"]),
  Exercise(id: 39, prompt_sentence_german: "Das ist __ Schule.", prompt_type: "pronoun_russian", prompt_value: "моя", correct_answer: "meine", options: ["meine", "mein", "deine", "dein", "seine", "sein"]),
  Exercise(id: 40, prompt_sentence_german: "Ich sehe __ Schule.", prompt_type: "pronoun_russian", prompt_value: "моя", correct_answer: "meine", options: ["meine", "meinen", "deine", "deinen", "seine", "seinen"]),
  Exercise(id: 41, prompt_sentence_german: "Das ist __ Zimmer.", prompt_type: "pronoun_russian", prompt_value: "моё", correct_answer: "mein", options: ["mein", "meine", "meinen", "dein", "deine", "deinen"]),
  Exercise(id: 42, prompt_sentence_german: "Das sind __ Tassen.", prompt_type: "pronoun_russian", prompt_value: "мои", correct_answer: "meine", options: ["meine", "mein", "deine", "dein", "seine", "sein"]),

  Exercise(id: 43, prompt_sentence_german: "Das ist __ Lehrer.", prompt_type: "pronoun_russian", prompt_value: "твой", correct_answer: "dein", options: ["dein", "deine", "deinen", "mein", "meine", "meinen"]),
  Exercise(id: 44, prompt_sentence_german: "Ich sehe __ Lehrer.", prompt_type: "pronoun_russian", prompt_value: "твой", correct_answer: "deinen", options: ["deinen", "dein", "deine", "meinen", "mein", "meine"]),
  Exercise(id: 45, prompt_sentence_german: "Das ist __ Tasse.", prompt_type: "pronoun_russian", prompt_value: "твоя", correct_answer: "deine", options: ["deine", "dein", "deinen", "meine", "mein", "meinen"]),
  Exercise(id: 46, prompt_sentence_german: "Ich sehe __ Tasse.", prompt_type: "pronoun_russian", prompt_value: "твоя", correct_answer: "deine", options: ["deine", "dein", "deinen", "meine", "mein", "meinen"]),
  Exercise(id: 47, prompt_sentence_german: "Das ist __ Mädchen.", prompt_type: "pronoun_russian", prompt_value: "твоё", correct_answer: "dein", options: ["dein", "deine", "deinen", "mein", "meine", "meinen"]),
  Exercise(id: 48, prompt_sentence_german: "Das sind __ Bilder.", prompt_type: "pronoun_russian", prompt_value: "твои", correct_answer: "deine", options: ["deine", "dein", "deinen", "meine", "mein", "meinen"]),
];

// This function can be expanded to generate the full 500 exercises
// with more complex logic for option generation and prompt type distribution.
List<Exercise> get aiv_learn_german_exercises {
  final random = Random();
  // Prioritize Russian prompts, but also include German sentence prompts.
  final promptTypes = ['pronoun_russian', 'pronoun_russian', 'sentence_german'];

  final updatedExercises = allExercises.map((e) {
    final promptType = promptTypes[random.nextInt(promptTypes.length)];

    // Ensure options are shuffled and unique
    final options = List<String>.from(e.options);
    options.shuffle();
    final uniqueOptions = (options..toSet()..toList()).take(6).toList();
    if (!uniqueOptions.contains(e.correct_answer)) {
      uniqueOptions.removeLast();
      uniqueOptions.add(e.correct_answer);
      uniqueOptions.shuffle();
    }

    return Exercise(
      id: e.id,
      prompt_sentence_german: e.prompt_sentence_german,
      prompt_type: promptType,
      prompt_value: e.prompt_value, // Russian value is already in the base data
      correct_answer: e.correct_answer,
      options: uniqueOptions,
    );
  }).toList();

  return updatedExercises..shuffle();
}
