import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

// We use get package for our state management

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Lets animated our progress bar

  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List sample_data = [
    {
      "id": 1,
      "answer_index": 0,
      "question": "நல்ல செயல், கெட்ட செயல் வித்தியாசம் / வேறுபாடு என்ன?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 2,
      "answer_index": 0,
      "question": "ஏன் நல்லது செய்ய வேண்டும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 3,
      "answer_index": 0,
      "question": "கெட்டவருக்கு ஏன் நல்லது செய்ய வேண்டும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 4,
      "answer_index": 0,
      "question": "நல்ல செயல் செய்வதால் நமக்கு என்ன பயன்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 5,
      "answer_index": 0,
      "question": "மற்றவர் எப்போது நம்மைப் பாராட்டுவர்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 6,
      "answer_index": 0,
      "question": "நமக்கு ஏன் பணம் தேவை?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 7,
      "answer_index": 0,
      "question": "நாம் ஏன் வேலைக்குச் செல்கிறோம்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 8,
      "answer_index": 0,
      "question": "நாம் ஏன் பணத்தை சேமிக்க வேண்டும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 9,
      "answer_index": 0,
      "question": "பணம் எப்படி நமது வாழ்க்கைக்கு உதவுகிறது?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 10,
      "answer_index": 0,
      "question": "பணம் இல்லையெனில் பூமிதனில் நமது வாழ்வு எப்படியிருக்கும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 11,
      "answer_index": 0,
      "question": "பொய் - பொருள் என்ன?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 12,
      "answer_index": 0,
      "question": "உண்மையால் வரும் இலாபம் என்ன?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 13,
      "answer_index": 0,
      "question": "பொய் சொல்லுவதால் வரும் நட்டம் என்ன?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 14,
      "answer_index": 0,
      "question": "உலகத்தார் யாரை போற்றுவர்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 15,
      "answer_index": 0,
      "question": "உலகத்தார் யாரைத் தூற்றுவர்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 16,
      "answer_index": 0,
      "question": "நல்ல பண்புகளின் அவசியம் என்ன?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 17,
      "answer_index": 0,
      "question": "நல்ல பண்புகள், கெட்ட பண்புகள் வித்தியாசம் என்ன?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 18,
      "answer_index": 0,
      "question": "உலகம் யாரை மதிக்கும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 19,
      "answer_index": 0,
      "question": "நமக்கு நல்ல பண்புகள் பயன் தருமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 20,
      "answer_index": 0,
      "question":
          "உங்களுக்கு நல்ல பண்புகள் உள்ள மனிதர், நாட்டின் தலைவர் யாரேனும் தெரியுமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 21,
      "answer_index": 0,
      "question": "ஏன் எழுத்துக்களைக் கற்றுக் கொள்ள வேண்டும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 22,
      "answer_index": 0,
      "question": "நீ உனது பெயரை எப்படி எழுதுகிறாய்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 23,
      "answer_index": 0,
      "question": "எண்களின் பயன் என்ன?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 24,
      "answer_index": 0,
      "question": "உனது ஊருக்குச் செல்லும் பேருந்தை எப்படிக் கண்டுபிடிப்பாய்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 25,
      "answer_index": 0,
      "question": "பணத்தின் மதிப்பை எப்படித் தெரிந்து கொள்வாய்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 26,
      "answer_index": 0,
      "question": "யார் நம்மிடம் மிக அன்பாக இருப்பர்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 27,
      "answer_index": 0,
      "question":
          "அம்மா, அப்பா தவிர வேறு யார் நம்மிடம் அன்பு செலுத்துகிறார்கள்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 28,
      "answer_index": 0,
      "question": "உலகத்தார் அதிகமாக விரும்புவது அன்பா? அல்லது பணமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 29,
      "answer_index": 0,
      "question": "வீட்டு விலங்குகளை நாம் எப்படி நடத்த வேண்டும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 30,
      "answer_index": 0,
      "question": "வீட்டிற்கு வந்தவரை நாம் எப்படி வரவேற்க வேண்டும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 31,
      "answer_index": 0,
      "question": "தண்ணீர் இல்லாமல் நாம் இங்கு வாழ முடியுமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 32,
      "answer_index": 0,
      "question": "பசியை போக்க நமக்கு என்ன தேவை?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 33,
      "answer_index": 0,
      "question": "உணவு சமைக்க என்ன பொருள்கள் எல்லாம் தேவை?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 34,
      "answer_index": 0,
      "question": "கடல் நீரைக் குடிக்க முடியுமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 35,
      "answer_index": 0,
      "question": "உணவையும், தண்ணீரையும் வீணாக்கலாமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 36,
      "answer_index": 0,
      "question": "நன்றி என்பது என்ன?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 37,
      "answer_index": 0,
      "question": "ஏன் மற்றவர் செய்த உதவியை மறக்கக் கூடாது?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 38,
      "answer_index": 0,
      "question": "செய்த நன்றியை மறந்தால் என்னவாகும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 39,
      "answer_index": 0,
      "question": "பிறர் செய்த தீமையை மறக்காலமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 40,
      "answer_index": 0,
      "question":
          "பிறர் உனக்கு உதவி செய்யாவிட்டாலும், நீ மற்றவர்க்கும் உதவி செய்வாயா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 41,
      "answer_index": 0,
      "question": "ஏன் காலமறிந்து செயல்பட வேண்டும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 42,
      "answer_index": 0,
      "question": "காலம் தாழ்த்தினால் வெற்றி கிடைக்குமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 43,
      "answer_index": 0,
      "question": "கொக்கின் செயல்பாட்டில் கவனச் சிதறல் உள்ளதா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 44,
      "answer_index": 0,
      "question": "காலம் அறிந்து செயல்படாமல் போனால் யாருக்கு வீண் நட்டம்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 45,
      "answer_index": 0,
      "question": "கவனச் சிதறல் ஏற்பட்டால் என்னவாகும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 46,
      "answer_index": 0,
      "question": "நாம் மற்றவரிடம் எப்படி பேச வேண்டும்?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 47,
      "answer_index": 0,
      "question": "இனிமையில்லாத சொல்லினால் பலன் உண்டா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 48,
      "answer_index": 0,
      "question": "நட்பு உருவாவதற்கு இன்சொல் தேவையா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 49,
      "answer_index": 0,
      "question": "இனிய சுவை தருவது காயா? கனியா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    },
    {
      "id": 50,
      "answer_index": 0,
      "question": "நீண்ட கால உறவை இனிய சொல் வளப்படுத்துமா?",
      "options": ["விருப்பம் 1", "விருப்பம் 2", "விருப்பம் 3", "விருப்பம் 4"]
    }
  ];

  late List<Question> _questions;

  @override
  void onInit() {
    super.onInit();

    // Initialize _questions here
    _questions = sample_data
        .map(
          (question) => Question(
            id: question['id'] is int
                ? question['id']
                : int.parse(question['id'].toString()),
            question: question['question'],
            options: question['options'],
            correctIndex: question['answer_index'] is int
                ? question['answer_index']
                : int.parse(question['answer_index'].toString()),
          ),
        )
        .toList();

    // Other initialization code
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
  }

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // // called just before the Controller is deleted from memory

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.correctIndex;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
