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

final List<LevelModel> appLevels = [
  LevelModel(
    index: 0,
    name: 'இன்னா செய்யாமை',
    stages: [
      StageModel(
        type: StageType.thirukural,
        title: 'திருக்குறள்',
        level: 1,
        kural: 'இன்னாசெய் தாரை ஒறுத்தல், அவர் நாண\nநன்னயம் செய்து விடல்',
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
            "image_description":
                "A child teasing another child and making them cry in a school playground.",
            'url': 'images/1-1.jpeg',
            'title': "இன்னா",
            'explanation':
                "தீங்கு தருபவை (Theengu Tharubavai) - துன்பத்தை/வலியை/தீங்கை ஏற்படுத்துவது"
          },
          {
            "image_description":
                "A teacher kindly explaining to a student why bullying is wrong, while others watch.",
            'url': 'images/1-2.jpeg',
            'title': "ஒறுத்தல்",
            'explanation':
                "தண்டித்தல் (Thandiththal) - தீங்கு செய்தவருக்குத் தண்டனை கொடுப்பது."
          },
          {
            "image_description":
                "A child helping an old lady cross the road with a smile.",
            'url': 'images/1-3.jpeg',
            'title': "நன்னயம்",
            'explanation':
                "நன்மையான செயல் (Nanmaiyaana Seyal) - நல்ல மற்றும் பயனுள்ள செயல்."
          },
          {
            "image_description":
                "A indian child embarrassed & hides her face after being kindly corrected.",
            'url': 'images/1-4.jpeg',
            'title': "நாண",
            'explanation':
                "வெட்கப்படும்படி (Vetkappatum Padi) - மனம் வெட்கப்படுதல், வெட்கமடைதல்."
          },
        ],
      ),
      StageModel(
        type: StageType.quiz,
        title: 'வினாடி வினா',
        level: 1,
        questions: [
          Question(
            id: 1,
            question: 'நல்ல செயல் என்பது என்ன ?',
            options: [
              'பிறருக்குத் தீங்கு செய்வது',
              'பிறருக்கு உதவுவது',
              'பணத்தை வீணாக்குவது'
            ],
            correctIndex: 1,
          ),
          Question(
            id: 2,
            question: 'கெட்ட செயல் என்பது என்ன?',
            options: [
              'பிறருக்கு உதவுவது',
              'பணத்தை சேமிப்பது',
              'பிறருக்குத் தீங்கு செய்வது'
            ],
            correctIndex: 2,
          ),
          Question(
            id: 3,
            question: 'கெட்டவருக்கு ஏன் நல்லது செய்ய வேண்டும்?',
            options: ['பழிவாங்க', 'திருத்த', 'தப்பிக்க'],
            correctIndex: 1,
          ),
          Question(
            id: 4,
            question: 'நல்ல செயல் செய்வதால் நமக்கு என்ன பயன்?',
            options: [
              'துன்பம் வரும்',
              'பணம் கிடைக்கும்',
              'மகிழ்ச்சி கிடைக்கும்'
            ],
            correctIndex: 2,
          ),
          Question(
            id: 5,
            question: 'மற்றவர் எப்போது நம்மைப் பாராட்டுவர்?',
            options: [
              'சண்டை போடும்போது',
              'தீங்கு செய்யும்போது',
              'நல்லது செய்யும்போது'
            ],
            correctIndex: 2,
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
            'அருளில்லார்க்கு அவ்வுலகம் இல்லை; பொருளில்லார்க்கு\nஇவ்வுலகம் இல்லாகி யாங்கு',
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
            "image_description":
                "A boy sharing his umbrella with a small puppy during rain, showing compassion and kindness.",
            'url': 'images/2-1.jpeg',
            'title': "அருள்",
            'explanation': "கருணை (Karunai) - இரக்கம், தயவு."
          },
          {
            "image_description":
                "A peaceful, glowing heaven in the clouds with happy people and gentle angels, symbolizing the world after death.",
            'url': 'images/2-2.jpeg',
            'title': "அவ்வுலகம்",
            'explanation':
                "அந்த உலகம் (Antha Ulagam) - இறந்த பிறகு செல்லும் உலகம்."
          },
          {
            "image_description":
                "A global map with children from different cultures holding hands around it, representing the world we live in.",
            'url': 'images/2-4.jpeg',
            'title': "இவ்வுலகம்",
            'explanation':
                "இந்த உலகம் (Indha Ulagam) - நாம் வாழும் உலகம்."
          },
          {
            "image_description":
                "Two Indian kids at a crossroads, thinking which path to choose — one filled with flowers, the other with thorns, representing a moral decision.",
            'url': 'images/2-3.jpeg',
            'title': "யாங்கு",
            'explanation':
                "எப்படி (Eppadi) - எவ்வாறு, ஒப்பிடுவதற்குப் பயன்படுத்தப்படும் சொல்."
          },
          {
            "image_description":
                "A boy with empty pockets looking sad while for the ice cream, showing life without means.",
            'url': 'images/2-4.jpeg',
            'title': "இல்லாகி",
            'explanation':
                "இல்லாமல் போகும் (Illaamal Pogum) - இருக்காது, இல்லாமல் ஆகிவிடும்."
          },
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
              'சோம்பேறியாக இருக்க',
              'வாழ்க்கை நடத்த',
              'வீண்செலவு செய்ய'
            ],
            correctIndex: 1,
          ),
          Question(
            id: 2,
            question: 'நாம் ஏன் வேலைக்குச் செல்கிறோம்?',
            options: ['தூங்க', 'பணம் சம்பாதிக்க', 'விளையாட'],
            correctIndex: 1,
          ),
          Question(
            id: 3,
            question: 'நாம் ஏன் பணத்தை சேமிக்க வேண்டும்?',
            options: ['விரயம் செய்ய', 'எதிர்காலத்திற்கு', 'கடன்பட'],
            correctIndex: 1,
          ),
          Question(
            id: 4,
            question: 'பணம் எப்படி நமது வாழ்க்கைக்கு உதவுகிறது?',
            options: [
              'கடன் வாங்க',
              'தேவைகளைப் பூர்த்தி செய்ய',
              'வேலை செய்யாமல் இருக்க'
            ],
            correctIndex: 1,
          ),
          Question(
            id: 5,
            question:
                'பணம் இல்லையெனில் பூமிதனில் நமது வாழ்வு எப்படியிருக்கும்?',
            options: [
              'மகிழ்ச்சியாக இருக்கும்',
              'சுலபமாக இருக்கும்',
              'கஷ்டமாக இருக்கும்'
            ],
            correctIndex: 2,
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
        kural: 'உள்ளத்தால் பொய்யாது ஒழுகின், உலகத்தார்\nஉள்ளத்து ளெல்லாம் உளன்',
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
            "image_description":
                "A child returning a lost wallet to the teacher, even when no one was watching.",
            'url': 'images/3-1.jpeg',
            'title': "பொய்யாது",
            'explanation': "பொய் சொல்லாமல் (Poi Sollaamal) - உண்மை பேசுவது."
          },
          {
            "image_description":
                "A child helping a friend in need and refusing to lie, showing good behavior.",
            'url': 'images/3-2.jpeg',
            'title': "ஒழுகின்",
            'explanation':
                "நடந்தால் (Nadanthaal) - ஒரு குறிப்பிட்ட வழியில் வாழ்ந்தால்."
          },
          {
            "image_description":
                "Children from different countries holding hands and smiling.",
            'url': 'images/3-3.jpeg',
            'title': "உலகத்தார்",
            'explanation':
                "உலக மக்கள் (Ulaga Makkal) - பூமியில் வாழும் மனிதர்கள்."
          },
          {
            "image_description":
                "A child writing in a journal with deep concentration, showing inner thoughts.",
            'url': 'images/3-4.jpeg',
            'title': "உள்ளத்தால்",
            'explanation':
                "மனதால் (Manathaal) - மனதிலிருந்து, உண்மையான எண்ணத்துடன்."
          },
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
            options: ['உண்மை', 'உண்மைக்கு மாறானது', 'கற்பனை'],
            correctIndex: 1,
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
            options: [
              'நட்பு',
              'நம்பிக்கை இழப்பு',
              'செல்வம்',
            ],
            correctIndex: 1,
          ),
          Question(
            id: 4,
            question: 'உலகத்தார் யாரை போற்றுவர்?',
            options: ['உண்மை பேசுபவரை', 'பொய் பேசுபவரை', 'கெட்டவரை'],
            correctIndex: 0,
          ),
          Question(
            id: 5,
            question: 'உலகத்தார் யாரைத் தூற்றுவர்?',
            options: ['நல்லவரை', 'உண்மை பேசுபவரை', 'பொய் பேசுபவரை'],
            correctIndex: 2,
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
            'பண்புடையார்ப் பட்டுண்டு உலகம், அது இன்றேல்\nமண்புக்கு மாய்வது மன்',
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
            "image_description":
                "A kind student sharing food and books with others.",
            'url': 'images/4-1.jpeg',
            'title': "பண்புடையார்",
            'explanation':
                "நல்ல குணம் உடையவர் (Nalla Gunam Udaiyavar) - சிறந்த நற்குணங்களைக் கொண்டவர்கள்."
          },
          {
            "image_description":
                "A tree giving shade to children sitting under it — it helps because it stands strong.",
            'url': 'images/4-2.jpeg',
            'title': "பட்டுண்டு",
            'explanation': "இருப்பதால் (Iruppathaal) - கொண்டிருப்பதால்."
          },
          {
            "image_description":
                "An ice cream melting under the sun, teaching things don't last forever.",
            'url': 'images/4-3.jpeg',
            'title': "மாயுது",
            'explanation':
                "அழிந்துவிடும் (Azhinthuvidum) - இல்லாமல் போய்விடும்."
          },
          {
            "image_description":
                "A large globe with diverse people surrounding it, showing the entire planet.",
            'url': 'images/4-4.jpeg',
            'title': "உலகம்",
            'explanation':
                "பூமி (Bhoomi) - நாம் வாழும் இடம், மக்கள் வாழும் இடம்."
          },
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
            options: ['சண்டை சச்சரவுக்கு', 'உலகம் நிலைக்க', 'தனிமைக்கு'],
            correctIndex: 1,
          ),
          Question(
            id: 2,
            question: 'நல்ல பண்புகள், கெட்ட பண்புகள் வித்தியாசம் என்ன?',
            options: [
              'வெறுப்பு vs அன்பு',
              'அன்பு vs வெறுப்பு',
              'இரண்டும் ஒன்று'
            ],
            correctIndex: 1,
          ),
          Question(
            id: 3,
            question: 'உலகம் யாரை மதிக்கும்?',
            options: ['கெட்ட பண்பாளர்', 'பணம் படைத்தவர்', 'நல்ல பண்பாளர்'],
            correctIndex: 2,
          ),
          Question(
            id: 4,
            question: 'நமக்கு நல்ல பண்புகள் பயன் தருமா?',
            options: ['இல்லை', 'ஆம்'],
            correctIndex: 1,
          ),
          Question(
            id: 5,
            question:
                'உங்களுக்கு நல்ல பண்புகள் உள்ள மனிதர், நாட்டின் தலைவர் யாரேனும் தெரியுமா?',
            options: ['ஹிட்லர்', 'மகாத்மா காந்தி', 'யாரும் இல்லை'],
            correctIndex: 1,
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
            'எண்ணென்ப ஏனை எழுத்தென்ப, இவ்விரண்டும்\nகண்ணென்ப வாழும் உயிர்க்கு',
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
            "image_description":
                "Children happily solving math problems on a blackboard.",
            'url': 'images/5-1.jpeg',
            'title': "எண்",
            'explanation': "எண்ணிக்கை (Ennikkai) - கணிதம்."
          },
          {
            "image_description":
                "Tamil letters flying from a book as children read together.",
            'url': 'images/5-2.jpeg',
            'title': "எழுத்து",
            'explanation': "இலக்கியம் (Ilakkiyam) - மொழியின் அடிப்படை."
          },
          {
            "image_description":
                "A child feeding birds and watering plants, showing love for life.",
            'url': 'images/5-3.jpeg',
            'title': "உயிர்க்கு",
            'explanation':
                "வாழும் ஜீவனுக்கு (Vaazhum Jeevanukku) - உயிர் உள்ளவனுக்கு."
          },
          {
            "image_description":
                "Two bright, clear eyes looking at a book, symbolizing how education helps us see clearly.",
            'url': 'images/5-4.jpeg',
            'title': "கண்",
            'explanation':
                "பார்வை (Paarvai) - பார்க்கும் உறுப்பு, வழிகாட்டி போன்றது."
          },
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
            options: ['தூங்க', 'படிக்க', 'விளையாட'],
            correctIndex: 1,
          ),
          Question(
            id: 2,
            question: 'நீ உனது பெயரை எப்படி யெழுதுகிறாய்?',
            options: [
              'படங்களை வரைந்து',
              'எழுத்துக்களை பயன்படுத்தி',
              'எண்களை பயன்படுத்தி'
            ],
            correctIndex: 1,
          ),
          Question(
            id: 3,
            question: 'எண்களின் பயன் என்ன?',
            options: ['சண்டையிட', 'தூங்க', 'கணக்கிட'],
            correctIndex: 2,
          ),
          Question(
            id: 4,
            question:
                'உனது ஊருக்குச் செல்லும் பேருந்தை எப்படிக் கண்டுபிடிப்பாய்?',
            options: [
              'நிறத்தைப் பார்த்து',
              'பேருந்து எண்ணைப் பார்த்து',
              'சத்தத்தை கேட்டு',
            ],
            correctIndex: 1,
          ),
          Question(
            id: 5,
            question: 'பணத்தின் மதிப்பை எப்படித் தெரிந்து கொள்வாய்?',
            options: [
              'எண்ணிக்கை',
              'எடை',
              'அளவு',
            ],
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
            'அன்பிலார் எல்லாம் தமக்குரியர்; அன்புடையார்\nஎன்பும் உரியர் பிறர்க்கு',
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
            "image_description":
                "Someone ignoring a hurt kitten while others walk by.",
            'url': 'images/6-1.jpeg',
            'title': "அன்பிலார்",
            'explanation':
                "அன்பு இல்லாதவர் (Anbu Illaadhavar) - பாசம் இல்லாதவர்கள்."
          },
          {
            "image_description":
                "A cartoon body shown with bones inside, to explain 'the whole body'.",
            'url': 'images/6-2.jpeg',
            'title': "என்பும்",
            'explanation':
                "உடம்பும் (Udambum) - எலும்பும் சேர்த்து, அதாவது முழு உடம்பும்."
          },
          {
            "image_description":
                "A child hugging their parents and grandparents happily.",
            'url': 'images/6-3.jpeg',
            'title': "உரியர்",
            'explanation': "சொந்தமானவர் (Sonthamaanavar) - உரியவர்கள்."
          },
          {
            "image_description":
                "A person selfishly keeping all toys to themselves while others look on sadly.",
            'url': 'images/6-4.jpeg',
            'title': "தமக்குரியர்",
            'explanation':
                "தனக்கு மட்டும் சொந்தம் (Thanakku Mattum Sontham) - தன்னலம் கொண்டவர்."
          },
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
            options: ['அந்நியர்', 'பகைவர்', 'அம்மா, அப்பா'],
            correctIndex: 2,
          ),
          Question(
            id: 2,
            question:
                'அம்மா, அப்பா தவிர வேறு யார் நம்மிடம் அன்பு செலுத்துகிறார்கள்?',
            options: ['தெரியாதவர்கள்', 'விலங்குகள்', 'நண்பர்கள், உறவினர்கள்'],
            correctIndex: 2,
          ),
          Question(
            id: 3,
            question: 'உலகத்தார் அதிகமாக விரும்புவது அன்பா? அல்லது பணமா?',
            options: ['பணம்', 'அன்பு', 'இரண்டும்'],
            correctIndex: 1,
          ),
          Question(
            id: 4,
            question: 'வீட்டு விலங்குகளை நாம் எப்படி நடத்த வேண்டும்?',
            options: ['கடுமையாக', 'துன்புறுத்த', 'அன்பாக'],
            correctIndex: 2,
          ),
          Question(
            id: 5,
            question: 'வீட்டிற்கு வந்தவரை நாம் எப்படி வரவேற்க வேண்டும்?',
            options: ['கோபமாக', 'அலட்சியமாக', 'சந்தோஷமாக'],
            correctIndex: 2,
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
            "image_description":
                "A child feeling sad after their friend lied and didn't keep a promise.",
            'url': 'images/7-1.jpeg',
            'title': "பொய்ப்பின்",
            'explanation': "தவறினால் (Thavarinaal) - பெய்யாமல் ஏமாற்றினால்."
          },
          {
            "image_description":
                "Children looking at a big blue ocean with ships and birds.",
            'url': 'images/7-2.jpeg',
            'title': "விரிநீர்",
            'explanation': "பரந்த நீர் (Parantha Neer) - பெரிய கடல்."
          },
          {
            "image_description":
                "A child crying after being left out of a group game.",
            'url': 'images/7-3.jpeg',
            'title': "உடற்றும்",
            'explanation': "வருத்தும் (Varuththum) - துன்புறுத்தும்."
          },
          {
            "image_description":
                "The bright sun, clouds and sky above, representing heaven or the sky.",
            'url': 'images/7-4.jpeg',
            'title': "விண்",
            'explanation':
                "வானம் (Vaanam) - மேலே உள்ள ஆகாயம், மழை பொழியும் இடம்."
          },
        ],
      ),
      StageModel(
        level: 7,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'தண்ணீர் இல்லாமல் நாம் இங்கு வாழ முடியுமா?',
            options: ['முடியும்', 'சில காலம்', 'முடியாது'],
            correctIndex: 2,
          ),
          Question(
            id: 2,
            question: 'பசியை போக்க நமக்கு என்ன தேவை?',
            options: ['விளையாட்டு', 'உணவு',  'பணம்', ],
            correctIndex: 1,
          ),
          Question(
            id: 3,
            question: 'உணவு சமைக்க என்ன பொருள்கள் எல்லாம் தேவை?',
            options: ['மண், கல்', 'துணிகள்', 'நீர், அரிசி, காய்கறிகள்'],
            correctIndex: 2,
          ),
          Question(
            id: 4,
            question: 'கடல் நீரைக் குடிக்க முடியுமா?',
            options: ['முடியும்', 'கொஞ்சம் குடிக்கலாம்', 'முடியாது'],
            correctIndex: 2,
          ),
          Question(
            id: 5,
            question: 'உணவையும், தண்ணீரையும் வீணாக்கலாமா?',
            options: ['ஆம்', 'கூடாது'],
            correctIndex: 1,
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
        kural: 'நன்றி மறப்பது நன்றன்று, நன்றல்லது\nஅன்றே மறப்பது நன்று',
        explanation:
            'நமக்கு ஒருவர் செய்த உதவியை மறக்கக் கூடாது, ஆனால் அவர் செய்த தீமையை உடனே மறந்துவிடுவது நல்லது.',
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
            "image_description":
                "A child looking confused after forgetting their school bag.",
            'url': 'images/8-1.jpeg',
            'title': "மறப்பது",
            'explanation':
                "நினைவில் கொள்ளாமல் இருப்பது (Ninaivil Kollaamal Iruppathu) - மறந்துவிடுவது."
          },
          {
            "image_description":
                "A child stealing candy while others look shocked.",
            'url': 'images/8-2.jpeg',
            'title': "நன்றன்று",
            'explanation': "நல்லது அன்று (Nallathu Anru) - தீயது."
          },
          {
            "image_description":
                "A kid throwing garbage on the road while others plant trees.",
            'url': 'images/8-3.jpeg',
            'title': "நன்றல்லது",
            'explanation': "தீய செயல் (Theeya Seyal) - கெட்டது."
          },
          {
            "image_description":
                "A child saying 'thank you' with a grateful smile after receiving help.",
            'url': 'images/8-4.jpeg',
            'title': "நன்றி",
            'explanation':
                "நன்றி உணர்வு (Nanri Unarvu) - உதவிக்கு கைம்மாறாக அன்பை வெளிப்படுத்துதல்."
          },
        ],
      ),
      StageModel(
        level: 8,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'நன்றி என்பது என்ன?',
            options: [
              'பணத்தைக் கொடுப்பது',
              'சண்டை போடுவது',
              'உதவியை அங்கீகரிப்பது'
            ],
            correctIndex: 2,
          ),
          Question(
            id: 2,
            question: 'ஏன் மற்றவர் செய்த உதவியை மறக்கக் கூடாது?',
            options: ['பகை உண்டாக', 'கடன் வாங்க', 'நட்பு வலுப்பெற'],
            correctIndex: 2,
          ),
          Question(
            id: 3,
            question: 'செய்த நன்றியை மறந்தால் என்னவாகும்?',
            options: [
              'பணம் கிடைக்கும்',
              'மதிப்பு குறையும்',
              'வெற்றி கிடைக்கும்'
            ],
            correctIndex: 1,
          ),
          Question(
            id: 4,
            question: 'பிறர் செய்த தீமையை மறக்கலாமா?',
            options: ['இல்லை', 'ஆம்'],
            correctIndex: 1,
          ),
          Question(
            id: 5,
            question:
                'பிறர் உனக்கு உதவி செய்யாவிட்டாலும், நீ மற்றவர்க்கும் உதவி செய்வாயா?',
            options: ['இல்லை', 'ஆம்'],
            correctIndex: 1,
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
        kural: 'கொக்கொக்க கூம்பும் பருவத்து மற்றதன்\nகுத்தொக்க சீர்த்த இடத்து',
        explanation:
            'காலத்தை எதிர்பார்க்க வேண்டிய பருவத்தில், கொக்கைப் போல இருந்து; காலம் வாய்த்த போதில் கொக்கு மீனைக் குத்தினாற் போலத் தவறாமல் செய்து முடிக்க வேண்டும்.',
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
            "image_description":
                "A white crane standing still in a pond, looking graceful.",
            'url': 'images/9-1.jpeg',
            'title': "கொக்கொக்க",
            'explanation': "கொக்கு போல (Kokkokka) - ஒரு வகை நீர்ப்பறவை போல."
          },
          {
            "image_description":
                "A group of birds sitting quietly on a tree at sunset.",
            'url': 'images/9-2.jpeg',
            'title': "கூம்பும்",
            'explanation':
                "காத்திருக்கும் (Kaaththirukkum) - அமைதியாக இருக்கும்."
          },
          {
            "image_description":
                "A child wearing clean uniform and standing ready for school assembly.",
            'url': 'images/9-3.jpeg',
            'title': "சீர்த்த",
            'explanation': "தகுந்த (Thaguntha) - சரியான."
          },
          {
            "image_description":
                "A heron swiftly striking at a fish in water, showing perfect timing.",
            'url': 'images/9-4.jpeg',
            'title': "குத்து",
            'explanation':
                "தாக்குதல் (Thaakkuthal) - சரியான நேரத்தில் துல்லியமாக செயல்படுதல்."
          },
        ],
      ),
      StageModel(
        level: 9,
        type: StageType.quiz,
        title: 'வினாடி வினா',
        questions: [
          Question(
            id: 1,
            question: 'ஏன் காலமறிந்து செயல்பட வேண்டும்?',
            options: ['தோல்வி அடைய', 'நேரத்தை வீணாக்க', 'வெற்றி பெற'],
            correctIndex: 2,
          ),
          Question(
            id: 2,
            question: 'காலம் தாழ்த்தினால் வெற்றி கிடைக்குமா?',
            options: ['கிடைக்கும்', 'சில நேரம் கிடைக்கும்', 'கிடைக்காது'],
            correctIndex: 2,
          ),
          Question(
            id: 3,
            question: 'கொக்கின் செயல்பாட்டில் கவனச் சிதறல் உள்ளதா?',
            options: ['ஆம்', 'இல்லை'],
            correctIndex: 1,
          ),
          Question(
            id: 4,
            question: 'காலம் அறிந்து செயல்படாமல் போனால் யாருக்கு வீண் நட்டம்?',
            options: ['மற்றவர்களுக்கு', 'யாருக்கும் இல்லை', 'செயல்படாதவருக்கு'],
            correctIndex: 2,
          ),
          Question(
            id: 5,
            question: 'கவனச் சிதறல் ஏற்பட்டால் என்னவாகும்?',
            options: ['வெற்றி', 'சந்தோஷம்', 'தோல்வி'],
            correctIndex: 2,
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
            "image_description":
                "A smiling child giving a flower to a sad friend to cheer them up.",
            'url': 'images/10-1.jpeg',
            'title': "இனிய",
            'explanation': "இனிமையான (Inimaiyana) - நல்ல."
          },
          {
            "image_description":
                "A child sharing their toys happily with others while saying 'Let's play together!'",
            'url': 'images/10-2.jpeg',
            'title': "உளவாக",
            'explanation':
                "இருக்கும்போது (Irukkumpothu) - கிடைக்கப் பெற்றிருக்கும்போது."
          },
          {
            "image_description":
                "A curious child reaching for a glowing magical book in a library.",
            'url': 'images/10-3.jpeg',
            'title': "கவர்ந்தற்று",
            'explanation':
                "கவர்ந்தது போன்றது (Kavarnthathu Pondrathu) - எடுத்துக்கொண்டது போல."
          },
          {
            "image_description":
                "Ripe, juicy fruits next to unripe ones, showing the difference between sweet and bitter.",
            'url': 'images/10-4.jpeg',
            'title': "கனி",
            'explanation':
                "பழுத்த பழம் (Pazhutha Pazham) - முதிர்ந்த பழம், இனிப்பான உணவு."
          },
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
            options: ['கடுமையாக', 'சண்டையிட்டு', 'இனிமையாக'],
            correctIndex: 2,
          ),
          Question(
            id: 2,
            question: 'இனிமையில்லாத சொல்லினால் பலன் உண்டா?',
            options: ['ஆம்', 'இல்லை'],
            correctIndex: 1,
          ),
          Question(
            id: 3,
            question: 'நட்பு உருவாவதற்கு இன்சொல் தேவையா?',
            options: ['தேவையில்லை', 'சில நேரம் தேவை', 'தேவை'],
            correctIndex: 2,
          ),
          Question(
            id: 4,
            question: 'இனிய சுவை தருவது காயா? கனியா?',
            options: ['காய்', 'இரண்டும்', 'கனி'],
            correctIndex: 2,
          ),
          Question(
            id: 5,
            question: 'நீண்ட கால உறவை இனிய சொல் பலப்படுத்துமா?',
            options: ['பலப்படுத்தாது', 'பலப்படுத்தும்'],
            correctIndex: 1,
          ),
        ],
      ),
    ],
  ),
];
