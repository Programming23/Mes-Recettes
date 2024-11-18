import 'package:flutter/material.dart';

List categories = [
  {'name': 'الحلويات', 'color': Colors.blue},
  {'name': 'المقبلات', 'color': Colors.orange},
  {'name': 'بيتزا', 'color': Colors.indigo},
];

List<dynamic> recipes_data = [
  {
    'id': 1,
    'name': 'كيكة الفانيليا',
    'description':
        'وصفة سهلة ولذيذة لكيكة الفانيليا التي تحضر بسهولة في المنزل',
    'category': 'الحلويات',
    'time': '60 دقيقة',
    'imageUrl': 'https://www.justfood.tv/UserFiles/vanillaCake.jpg',
    'ingredients': [
      'كوب دقيق',
      'نصف كوب سكر',
      'ملعقة صغيرة بيكنج باودر',
      'بيضة',
      'نصف كوب حليب',
      'نصف كوب زيت',
      'فانيليا'
    ],
    'steps': [
      '1. في وعاء، امزجي الدقيق، السكر والبيكنج باودر حتى تتداخل المكونات جيداً.',
      '2. في وعاء آخر، اخفقي البيض ثم أضيفي الحليب والزيت والفانيليا وامزجي حتى تحصلي على خليط متجانس.',
      '3. أضيفي الخليط السائل إلى الخليط الجاف وامزجي حتى يصبح العجين متجانساً.',
      '4. اسكبي العجين في قالب مدهون بالزبدة ورشي الوجه بالسكر ثم ادخلي القالب إلى فرن محمى مسبقاً على حرارة 180 درجة مئوية لمدة 40 - 45 دقيقة حتى ينضج الكيك ويتحول لونه إلى اللون الذهبي.',
      '5. اخرجي الكيك من الفرن واتركيه يبرد قليلاً ثم قطعيه وقدميه مع فنجان قهوة أو شاي.'
    ],
  },
  {
    'id': 2,
    'name': 'حلويات الصابلي بالمكسرات',
    'description':
        'حلويات الصابلي بالمكسرات هي حلوى عربية تتكون من طبقات من العجين المحشو بالمكسرات والسكر، وتزين بالقطر والفستق الحلبي المفروم.',
    'category': 'الحلويات',
    'time': '45 دقيقة',
    'imageUrl': 'https://i.ytimg.com/vi/bT2HqotTLqA/maxresdefault.jpg',
    'ingredients': [
      '2 أكواب من الطحين الأبيض',
      '1 كوب من السميد الناعم',
      '1 كوب من السكر',
      '1 كوب من الزيت النباتي',
      '1 كوب من الماء',
      '1 ملعقة صغيرة من الخميرة الفورية',
      '1 كوب من الفستق الحلبي المفروم',
      '1/2 كوب من السكر البودرة',
      '1/4 كوب من العسل',
      '1/4 كوب من الماء',
      '2 ملعقة كبيرة من الماء ورد',
    ],
    'steps': [
      'في وعاء كبير، اخلطي الطحين الأبيض والسميد الناعم والسكر والخميرة الفورية جيدًا.',
      'أضيفي الزيت النباتي والماء تدريجيًا واعجني المكونات جيدًا حتى تحصلي على عجينة ناعمة.',
      'اتركي العجينة ترتاح لمدة 30 دقيقة.',
      'في وعاء آخر، اخلطي الفستق الحلبي المفروم والسكر البودرة والعسل والماء والماء الورد.',
      'قسمي العجينة إلى 3 قسمات متساوية.',
      'في صينية مدهونة بالقليل من الزيت، ضعي القسم الأول من العجينة وافرديه باليد.',
      'اسكبي عليها طبقة من الحشوة المكونة من الفستق الحلبي.',
      'أضيفي القسم الثاني من العجينة وافرديه باليد، ثم ضعي عليه طبقة من الحشوة.',
      'أضيفي القسم الأخير من العجينةوافرديه جيدًا، ثم قطعي العجينة إلى مربعات صغيرة.'
          'اخبزي الصابلي في فرن محمى مسبقًا على درجة حرارة 180 درجة مئوية لمدة 15-20 دقيقة حتى يصبح ذهبي اللون.',
      'اخرجي الصابلي من الفرن واتركيه يبرد قليلاً.',
      'في وعاء صغير، اخلطي العسل والماء الورد جيدًا لتحضير القطر.',
      'صبي القطر على الصابلي الدافئ، ثم رشي الفستق الحلبي المفروم على الوجه.',
      'اتركي الصابلي ليبرد تمامًا، ثم قدميه.',
    ],
  },
  {
    'id': 3,
    'name': 'سلطة الفواكه بالزبادي',
    'description':
        'سلطة الفواكه بالزبادي هي وصفة صحية ومنعشة تحتوي على مجموعة من الفواكه الملونة والمغذية مع قليل من الزبادي الطازج والعسل.',
    'category': 'المقبلات',
    'time': '15 دقيقة',
    'imageUrl':
        'https://shamlola.s3.amazonaws.com/Shamlola_Images/8/src/00b900bfc4706ecc36009130c66be5b517b60769.jpg',
    'ingredients': [
      '1 كوب من الزبادي الطازج',
      '1 ملعقة كبيرة من عصير الليمون الطازج',
      '1 ملعقة كبيرة من العسل',
      '2 موزات مقطعة إلى شرائح',
      '1 كوب من الفراولة المقطعة إلى أرباع',
      '1 كوب من العنب الأحمر',
      '1 كوب من الأناناس المقطع إلى مكعبات',
      '1 كوب من الكيوي المقطع إلى شرائح',
      '1/2 كوب من المكسرات المشكلة (للتزيين)',
    ],
    'steps': [
      'في وعاء كبير، اخفقي الزبادي وعصير الليمون والعسل حتى يصبح المزيج ناعماً ومتجانساً.',
      'أضيفي الفواكه المقطعة إلى الزبادي وقلبي المكونات حتى تتداخل.',
      'ضعي السلطة في طبق التقديم وزيّنيها بالمكسرات المشكلة.',
      'يُمكن تقديم السلطة على الفور أو وضعها في الثلاجة لتبرد لمدة ساعتين قبل التقديم.'
    ]
  },
  {
    'id': 4,
    'name': 'بيتزا بالمشروم والزيتون',
    'imageUrl': 'assets/pitza.jpg',
    'description':
        'بيتزا بالمشروم والزيتون هي وصفة شهية وسهلة التحضير، تتميز بقشرتها الهشة ومذاقها اللذيذ.',
    'category': 'بيتزا',
    'time': '30 دقيقة',
    'ingredients': [
      'عجينة بيتزا جاهزة',
      '2 ملعقة كبيرة من صلصة الطماطم',
      '150 غرام من المشروم المقطع إلى شرائح',
      '150 غرام من الزيتون المقطع',
      '1 بصلة مفرومة',
      '2 فصوص من الثوم المفروم',
      '2 ملعقة كبيرة من زيت الزيتون',
      '200 غرام من الجبن الموزاريلا المبشور'
    ],
    'steps': [
      'سخني الفرن على درجة حرارة 200 درجة مئوية.',
      'افتحي عجينة البيتزا وضعيها في صينية الخبز المخصصة للبيتزا.',
      'ادهني العجينة بالصلصة الطماطم.',
      'في مقلاة، سخني زيت الزيتون ثم أضيفي البصل والثوم وحركي المكونات حتى يتحول البصل لونه إلى اللون الذهبي.',
      'أضيفي الزيتون والمشروم إلى المقلاة وحركي المكونات جيدًا.',
      'اسكبي الخليط على عجينة البيتزا المدهونة بالصلصة الطماطم.',
      'رشي الجبن الموزاريلا المبشور فوق الخليط.',
      'ضعي البيتزا في الفرن واتركيها حتى تنضج ويصبح لونها ذهبيًا، وذلك لمدة 20-25 دقيقة.',
      'قدمي البيتزا ساخنة.'
    ]
  }
];
