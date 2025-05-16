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
            "image_description":
                "A boy sharing his umbrella with a puppy in the rain.",
            'url': 'images/2-1.jpeg',
            'title': "அருள்",
            'explanation': "கருணை (Karunai) - இரக்கம், தயவு."
          },
          {
            "image_description":
                "A glowing, peaceful place in the clouds with happy people and angels, showing ‘heaven’ gently.",
            'url': 'images/2-2.jpeg',
            'title': "அவ்வுலகம்",
            'explanation':
                "அந்த உலகம் (Antha Ulagam) - இறந்த பிறகு செல்லும் உலகம்."
          },
          {
            "image_description":
                "Two kids thinking which path to take: one is full of flowers, the other has thorns.",
            'url': 'images/2-3.jpeg',
            'title': "யாங்கு",
            'explanation':
                "எப்படி (Eppadi) - எவ்வாறு, ஒப்பிடுவதற்குப் பயன்படுத்தப்படும் சொல்."
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
                "An ice cream melting under the sun, teaching things don’t last forever.",
            'url': 'images/4-3.jpeg',
            'title': "மாயுது",
            'explanation':
                "அழிந்துவிடும் (Azhinthuvidum) - இல்லாமல் போய்விடும்."
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
            "image_description":
                "Someone ignoring a hurt kitten while others walk by.",
            'url': 'images/6-1.jpeg',
            'title': "அன்பிலார்",
            'explanation':
                "அன்பு இல்லாதவர் (Anbu Illaadhavar) - பாசம் இல்லாதவர்கள்."
          },
          {
            "image_description":
                "A cartoon body shown with bones inside, to explain ‘the whole body’.",
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
            "image_description":
                "A child feeling sad after their friend lied and didn’t keep a promise.",
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
            "image_description":
                "A smiling child giving a flower to a sad friend to cheer them up.",
            'url': 'images/10-1.jpeg',
            'title': "இனிய",
            'explanation': "இனிமையான (Inimaiyana) - நல்ல."
          },
          {
            "image_description":
                "A child sharing their toys happily with others while saying ‘Let’s play together!’",
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
