import '../models/Questions.dart';

final List<String> chapters = [
  'இன்னா செய்யாமை',
  'பொருள் (அருளுடைமை)',
  'வாய்மை',
  'பண்புடைமை',
  'கல்வி',
  'அன்புடைமை',
  'வான்சிறப்பு',
  'செய்நன்றி அறிதல்',
  'காலம் அறிதல்',
  'இனியவை கூறல்',
];

final List<String> stages = [
  'திருக்குறள்',
  'வீடியோ',
  'படங்கள்',
  'வினாடி வினா',
];

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
    "question": "அம்மா, அப்பா தவிர வேறு யார் நம்மிடம் அன்பு செலுத்துகிறார்கள்?",
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

final List<LevelModel> appLevels = [
  LevelModel(
    index: 0,
    name: 'இன்னா செய்யாமை',
    stages: [
      StageModel(
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        level: 1,
        kural: 'இன்னாசெய் தாரை ஒறுத்தல் அவர் நாண\nநன்னயம் செய்து விடல்',
        explanation:
            'ஒருவர் உனக்கு தீங்கு செய்தால், அவரைத் தண்டிக்க சிறந்த வழி, அவர் வெட்கப்படும்படி அவருக்கு நன்மை செய்வது.',
      ),
      StageModel(
        type: StageType.video,
        title: 'வீடியோ',
        level: 1,
      ),
      StageModel(
        type: StageType.photos,
        title: 'படம்',
        level: 1,
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        type: StageType.quiz,
        title: 'வினாடி வினா',
        level: 1,
        questions: [
          Question(
            id: 1,
            question: 'நல்ல செயல், கெட்ட செயல் வித்தியாசம் என்ன?',
            options: [
              'பிறருக்கு உதவுவது',
              'பிறருக்குத் தீங்கு செய்வது',
              'இரண்டும்'
            ],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'ஏன் நல்லது செய்ய வேண்டும்?',
            options: ['மகிழ்ச்சி பெற', 'வெறுப்பை சம்பாதிக்க', 'தண்டனை பெற'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'கெட்டவருக்கு ஏன் நல்லது செய்ய வேண்டும்?',
            options: ['திருத்த', 'பழிவாங்க', 'தப்பிக்க'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 1,
    name: 'பொருள்',
    stages: [
      StageModel(
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        level: 2,
        kural:
            'அருளில்லார்க்கு அவ்வுலகம் இல்லை பொருளில்லார்க்கு\nஇவ்வுலகம் இல்லாகி யாங்கு',
        explanation:
            'அருள் இல்லாதவர்களுக்கு மேலுலகம் இல்லை; அதுபோல, பொருள் இல்லாதவர்களுக்கு இவ்வுலக வாழ்க்கை இல்லை.',
      ),
      StageModel(
        type: StageType.video,
        title: 'வீடியோ',
        level: 2,
      ),
      StageModel(
        type: StageType.photos,
        title: 'படம்',
        level: 2,
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        type: StageType.quiz,
        title: 'வினாடி வினா',
        level: 2,
        questions: [
          Question(
            id: 1,
            question: 'நமக்கு ஏன் பணம் தேவை?',
            options: [
              'வாழ்க்கை நடத்த',
              'வீண்செலவு செய்ய',
              'சோம்பேறியாக இருக்க'
            ],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'நாம் ஏன் வேலைக்குச் செல்கிறோம்?',
            options: ['பணம் சம்பாதிக்க', 'தூங்க', 'விளையாட'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'நாம் ஏன் பணத்தை சேமிக்க வேண்டும்?',
            options: ['எதிர்காலத்திற்கு', 'கடன்பட', 'விரயம் செய்ய'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 2,
    name: 'வாய்மை',
    stages: [
      StageModel(
        level: 3,
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        kural: 'உள்ளத்தால் பொய்யாது ஒழுகின் உலகத்தார்\nஉள்ளத்து ளெல்லாம் உளன்',
        explanation:
            'ஒருவர் தன் மனதில் பொய் இல்லாமல் வாழ்ந்தால், அவர் உலகத்தார் மனதில் என்றென்றும் வாழ்வார்.',
      ),
      StageModel(
        level: 3,
        type: StageType.video,
        title: 'வீடியோ',
      ),
      StageModel(
        level: 3,
        type: StageType.photos,
        title: 'படம்',
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        level: 3,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'பொய் - பொருள் என்ன?',
            options: ['உண்மைக்கு மாறானது', 'உண்மை', 'கற்பனை'],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'உண்மையால் வரும் இலாபம் என்ன?',
            options: ['நம்பிக்கை', 'பகை', 'தனிமை'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'பொய் சொல்லுவதால் வரும் நட்டம் என்ன?',
            options: ['நம்பிக்கை இழப்பு', 'நட்பு', 'செல்வம்'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 3,
    name: 'பண்புடைமை',
    stages: [
      StageModel(
        level: 4,
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        kural:
            'பண்புடையார்ப் பட்டுண்டு உலகம் அது இன்றேல்\nமண்புக்கு மாய்வது மன்',
        explanation:
            'நல்ல பண்புடையவர்கள் இருப்பதால் தான் உலகம் இன்னும் இயங்கிக் கொண்டிருக்கிறது. அவர்கள் இல்லையென்றால் மண்மேடாக அழிந்து போயிருக்கும்.',
      ),
      StageModel(
        level: 4,
        type: StageType.video,
        title: 'வீடியோ',
      ),
      StageModel(
        level: 4,
        type: StageType.photos,
        title: 'படம்',
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        level: 4,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'நல்ல பண்புகளின் அவசியம் என்ன?',
            options: ['உலகம் நிலைக்க', 'சண்டை சச்சரவுக்கு', 'தனிமைக்கு'],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'நல்ல பண்புகள், கெட்ட பண்புகள் வித்தியாசம் என்ன?',
            options: [
              'அன்பு vs வெறுப்பு',
              'வெறுப்பு vs அன்பு',
              'இரண்டும் ஒன்று'
            ],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'உலகம் யாரை மதிக்கும்?',
            options: ['நல்ல பண்பாளர்', 'கெட்ட பண்பாளர்', 'பணம் படைத்தவர்'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 4,
    name: 'கல்வி',
    stages: [
      StageModel(
        level: 5,
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        kural:
            'எண்ணென்ப ஏனை எழுத்தென்ப இவ்விரண்டும்\nகண்ணென்ப வாழும் உயிர்க்கு',
        explanation:
            'எண் மற்றும் எழுத்து இரண்டும் வாழும் உயிர்களுக்கு கண்கள் போன்றவை.',
      ),
      StageModel(
        level: 5,
        type: StageType.video,
        title: 'வீடியோ',
      ),
      StageModel(
        level: 5,
        type: StageType.photos,
        title: 'படம்',
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        level: 5,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'ஏன் எழுத்துக்களைக் கற்றுக் கொள்ள வேண்டும்?',
            options: ['படிக்க', 'தூங்க', 'விளையாட'],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'எண்களின் பயன் என்ன?',
            options: ['கணக்கிட', 'சண்டையிட', 'தூங்க'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'பணத்தின் மதிப்பை எப்படித் தெரிந்து கொள்வாய்?',
            options: ['எண்ணிக்கை', 'எடை', 'அளவு'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 5,
    name: 'அன்புடைமை',
    stages: [
      StageModel(
        level: 6,
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        kural:
            'அன்பிலார் எல்லாம் தமக்குரியர் அன்புடையார்\nஎன்பும் உரியர் பிறர்க்கு',
        explanation:
            'அன்பு இல்லாதவர்கள் எல்லாவற்றையும் தமக்கே என்பார்கள். அன்பு உடையவர்கள் தம் உடலையும் பிறர்க்கு உரியது என்பார்கள்.',
      ),
      StageModel(
        level: 6,
        type: StageType.video,
        title: 'வீடியோ',
      ),
      StageModel(
        level: 6,
        type: StageType.photos,
        title: 'படம்',
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        level: 6,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'யார் நம்மிடம் மிக அன்பாக இருப்பர்?',
            options: ['அம்மா, அப்பா', 'பகைவர்', 'அந்நியர்'],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'உலகத்தார் அதிகமாக விரும்புவது அன்பா? அல்லது பணமா?',
            options: ['அன்பு', 'பணம்', 'இரண்டும்'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'வீட்டு விலங்குகளை நாம் எப்படி நடத்த வேண்டும்?',
            options: ['அன்பாக', 'கடுமையாக', 'துன்புறுத்த'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 6,
    name: 'வான்சிறப்பு',
    stages: [
      StageModel(
        level: 7,
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        kural:
            'விண் இன்று பொய்ப்பின் விரிநீர் வியனுலகத்து\nஉள்நின்று உடற்றும் பசி',
        explanation:
            'மழை பெய்யாமல் பொய்த்தால், இந்த பரந்த உலகில் பசி வாட்டும்.',
      ),
      StageModel(
        level: 7,
        type: StageType.video,
        title: 'வீடியோ',
      ),
      StageModel(
        level: 7,
        type: StageType.photos,
        title: 'படம்',
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        level: 7,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'மழை பெய்யாவிட்டால் என்ன நடக்கும்?',
            options: ['பஞ்சம் வரும்', 'வெள்ளம் வரும்', 'நோய் வரும்'],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'மழை எதற்கு முக்கியம்?',
            options: ['உணவு உற்பத்தி', 'விளையாட', 'தூங்க'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'மழை நீரை நாம் எப்படி சேமிக்கலாம்?',
            options: ['நீர்த்தேக்கம் அமைத்து', 'வீணடித்து', 'குடிக்காமல்'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 7,
    name: 'செய்நன்றி அறிதல்',
    stages: [
      StageModel(
        level: 8,
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        kural: 'காலத்தி னால்செய்த நன்றி சிறிதுஎனின்\nஞாலத்தின் மாணப் பெரிது',
        explanation:
            'சரியான நேரத்தில் செய்யப்படும் உதவி சிறியதாக இருந்தாலும், அதன் மதிப்பு உலகத்தை விட பெரியது.',
      ),
      StageModel(
        level: 8,
        type: StageType.video,
        title: 'வீடியோ',
      ),
      StageModel(
        level: 8,
        type: StageType.photos,
        title: 'படம்',
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        level: 8,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'நமக்கு யாராவது உதவி செய்தால் என்ன செய்ய வேண்டும்?',
            options: [
              'நன்றி சொல்ல வேண்டும்',
              'மறந்து விட வேண்டும்',
              'திட்ட வேண்டும்'
            ],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'நன்றி மறப்பது நல்ல செயலா?',
            options: ['இல்லை', 'ஆம்', 'தெரியாது'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'உதவி செய்தவருக்கு திரும்ப உதவி செய்வது கடமையா?',
            options: ['ஆம்', 'இல்லை', 'சில நேரம்'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 8,
    name: 'காலம் அறிதல்',
    stages: [
      StageModel(
        level: 9,
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        kural: 'காலம் கருதி இருப்பர் கலங்காது\nஞாலம் கருது பவர்',
        explanation:
            'உலகத்தை வெல்ல நினைப்பவர்கள் சரியான நேரத்திற்காகக் காத்திருப்பார்கள், கலங்க மாட்டார்கள்.',
      ),
      StageModel(
        level: 9,
        type: StageType.video,
        title: 'வீடியோ',
      ),
      StageModel(
        level: 9,
        type: StageType.photos,
        title: 'படம்',
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        level: 9,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'எந்த நேரத்தில் ஒரு செயலைச் செய்ய வேண்டும்?',
            options: [
              'சரியான நேரம்',
              'எந்த நேரம் வேண்டுமானாலும்',
              'தவறான நேரம்'
            ],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'காலம் தாழ்த்திச் செய்தால் என்ன ஆகும்?',
            options: ['தோல்வி', 'வெற்றி', 'சந்தோஷம்'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'முயற்சி செய்யாமல் காலம் பார்ப்பது சரியா?',
            options: ['தவறு', 'சரி', 'சில நேரம் சரி'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
  LevelModel(
    index: 9,
    name: 'இனியவை கூறல்',
    stages: [
      StageModel(
        level: 10,
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        kural: 'இனிய உளவாக இன்னாத கூறல்\nகனிஇருப்பக் காய் கவர்ந் தற்று',
        explanation:
            'இனிய சொற்கள் இருக்கும்போது, துன்பம் தரும் சொற்களைப் பேசுவது, கனி இருக்கும்போது காயை உண்பது போன்றது.',
      ),
      StageModel(
        level: 10,
        type: StageType.video,
        title: 'வீடியோ',
      ),
      StageModel(
        level: 10,
        type: StageType.photos,
        title: 'படம்',
        images: [
          {
            'url': 'assets/images/story1.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story2.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          },
          {
            'url': 'assets/images/story3.png',
            'title': 'அச்சம்',
            'description':
                'அச்சம் என்பது பயம் அல்லது ஒரு ஆபத்து பற்றிய கவலை என்று பொருள்',
          }
        ],
      ),
      StageModel(
        level: 10,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'நாம் மற்றவரிடம் எப்படி பேச வேண்டும்?',
            options: ['இனிமையாக', 'கடுமையாக', 'சண்டையிட்டு'],
            correctIndex: 0,
          ),
          Question(
            id: 2,
            question: 'இனிமையில்லாத சொல் தீங்கு தருமா?',
            options: ['தரும்', 'தராது', 'சில நேரம் தரும்'],
            correctIndex: 0,
          ),
          Question(
            id: 3,
            question: 'நட்பு உருவாக இனிய சொல் தேவையா?',
            options: ['தேவை', 'தேவையில்லை', 'சில நேரம் தேவை'],
            correctIndex: 0,
          ),
        ],
      ),
    ],
  ),
];
