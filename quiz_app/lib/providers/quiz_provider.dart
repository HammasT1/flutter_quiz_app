import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuizProvider with ChangeNotifier {
  final List<Question> _questions = [
    Question(
      question: "What is the capital of France?",
      options: ["Paris", "London", "Berlin", "Madrid"],
      correctAnswer: "Paris",
    ),
    Question(
      question: "Which planet is known as the Red Planet?",
      options: ["Jupiter", "Mars", "Venus", "Mercury"],
      correctAnswer: "Mars",
    ),
    Question(
      question: "What is 2 + 2?",
      options: ["3", "4", "5", "6"],
      correctAnswer: "4",
    ),
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  Map<int, String?> _userAnswers = {};

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  int get score => _score;
  Map<int, String?> get userAnswers => _userAnswers;

  void answerQuestion(String answer) {
    _userAnswers[_currentQuestionIndex] = answer;
    if (answer == currentQuestion.correctAnswer) {
      _score++;
    }
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  // Added method to go to the previous question
  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  bool get isQuizFinished => _currentQuestionIndex == _questions.length - 1;

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    _userAnswers.clear();
    notifyListeners();
  }
}