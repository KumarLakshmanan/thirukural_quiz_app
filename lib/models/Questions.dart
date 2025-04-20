class Question {
  final int id, correctIndex;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.correctIndex,
    required this.options,
  });
  
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      correctIndex: json['correctIndex'],
      options: List<String>.from(json['options']),
    );
  }
}

class LevelModel {
  final int index;
  final String name;
  final List<StageModel> stages;

  LevelModel({
    required this.index,
    required this.name,
    required this.stages,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        index: json['index'],
        name: json['name'],
        stages: List<StageModel>.from(
            json['stages'].map((x) => StageModel.fromJson(x))),
      );
}

class StageModel {
  final StageType type;
  final String title;
  final String? kural;
  final String? explanation;
  final String? videoUrl;
  final List<Map<String, String>>? images;
  final List<Question>? questions;

  StageModel({
    required this.type,
    required this.title,
    this.kural,
    this.explanation,
    this.videoUrl,
    this.images,
    this.questions,
  });

  factory StageModel.fromJson(Map<String, dynamic> json) {
    return StageModel(
      type: StageType.values.firstWhere((e) => e.name == json['type']),
      title: json['title'],
      kural: json['kural'],
      explanation: json['explanation'],
      videoUrl: json['url'],
      images: json['images'] != null
          ? List<Map<String, String>>.from(json['images'])
          : null,
      questions: json['questions'] != null
          ? List<Question>.from(
              json['questions'].map((x) => Question.fromJson(x)))
          : null,
    );
  }
}

enum StageType {
  thirukural,
  video,
  photos,
  reading,
  quiz,
}
