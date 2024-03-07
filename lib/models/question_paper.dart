import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String id;
  String? title;
  String? imageUrl;
  String? description;
  int? timeSeconds;
  List<Questions>? questions;

  QuestionPaperModel({
    required this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.timeSeconds,
    this.questions,
  });

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['description'],
        timeSeconds = json['time_seconds'],
        questions = (json['questions'] as List).map((e) => Questions.fromJson(e)).toList();

  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['description'],
        timeSeconds = json['time_seconds'],
        questions = [];

  String timeInMins() => '${(timeSeconds! / 60).ceil()} mins';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image_url'] = imageUrl;
    map['description'] = description;
    map['time_seconds'] = timeSeconds;
    if (questions != null) {
      map['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;

  Questions({
    required this.id,
    required this.question,
    required this.answers,
    this.correctAnswer,
  });

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers = (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    if (answers != null) {
      map['answers'] = answers.map((v) => v.toJson()).toList();
    }
    map['correct_answer'] = correctAnswer;
    return map;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({
    this.identifier,
    this.answer,
  });

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = identifier;
    map['Answer'] = answer;
    return map;
  }
}
