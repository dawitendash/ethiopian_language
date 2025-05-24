enum SupportedLanguage { amharic, oromiffa, tigrigna, english }

String getLanguageDisplayName(SupportedLanguage lang) {
  switch (lang) {
    case SupportedLanguage.amharic:
      return "Amharic";
    case SupportedLanguage.oromiffa:
      return "Oromiffa";
    case SupportedLanguage.tigrigna:
      return "Tigrigna";
    case SupportedLanguage.english:
      return "English";
  }
}

Map<SupportedLanguage, List<Map<String, dynamic>>> getQuizQuestions() {
  return {
    SupportedLanguage.amharic: [
      {
        'question': 'What is the Amharic translation of "Good evening"?',
        'options': ['ሰላም', 'ደህና እንደራችሁ?', 'እንደምን አምሳላችሁ?', 'ጤና ይስጥልኝ'],
        'correctAnswer': 'ጤና ይስጥልኝ',
      },
      {
        'question': 'What is the Amharic translation of "We thank you"?',
        'options': ['አመሰግናለሁ', 'ሰላም', 'ተናደ', 'እሺ'],
        'correctAnswer': 'አመሰግናለሁ',
      },
      {
        'question': 'What is the Amharic word for "Hello"?',
        'options': ['ሰላም', 'ቻው', 'አመሰግናለሁ', 'እባክህ'],
        'correctAnswer': 'ሰላም',
      },
      {
        'question': 'What is the Amharic word for "Please"?',
        'options': ['አመሰግናለሁ', 'እባክህ', 'ደህና እንደምን አደርክ', 'ቻው'],
        'correctAnswer': 'እባክህ',
      },
      {
        'question': 'How do you say "five" in Amharic?',
        'options': ['አምስት', 'ሁለት', 'አስር', 'አንድ'],
        'correctAnswer': 'አምስት',
      },
      {
        'question':
            'What is the appropriate response to "Dehna indemin aderk" (Good morning) in Amharic?',
        'options': ['አመሰግናለሁ', 'ደህና ነኝ', 'ሰላም', 'ቻው'],
        'correctAnswer': 'ደህና ነኝ',
      },
      {
        'question': 'What is the Amharic word for "Lesson"?',
        'options': ['ትምህርት ቤት', 'መምህር', 'ትምህርት', 'መጽሐፍ'],
        'correctAnswer': 'ትምህርት',
      },
      {
        'question': 'What is the Amharic word for "Goodbye"?',
        'options': ['ሰላም', 'ቻው', 'አመሰግናለሁ', 'እባክህ'],
        'correctAnswer': 'ቻው',
      },
      {
        'question': 'How do you say "ten" in Amharic?',
        'options': ['አምስት', 'አስር', 'ሁለት', 'አንድ'],
        'correctAnswer': 'አስር',
      },
      {
        'question': 'What is the Amharic word for "Water"?',
        'options': ['ምግብ', 'ውሃ', 'ቤት', 'መኪና'],
        'correctAnswer': 'ውሃ',
      },
      {
        'question':
            'What is the appropriate response to "Indemin alesh?" (How are you, female) in Amharic?',
        'options': ['አመሰግናለሁ', 'ደህና ነኝ', 'ሰላም', 'ቻው'],
        'correctAnswer': 'ደህና ነኝ',
      },
      {
        'question': 'What is the Amharic word for "Food"?',
        'options': ['ምግብ', 'ውሃ', 'ቀሚስ', 'መጽሐፍ'],
        'correctAnswer': 'ምግብ',
      },
      {
        'question': 'How do you say "two" in Amharic?',
        'options': ['አንድ', 'ሁለት', 'ሶስት', 'አራት'],
        'correctAnswer': 'ሁለት',
      },
      {
        'question': 'What is the Amharic word for "House"?',
        'options': ['ትምህርት ቤት', 'ቤት', 'መኪና', 'መንገድ'],
        'correctAnswer': 'ቤት',
      },
      {
        'question': 'What does "Ene feligalehu" mean in Amharic?',
        'options': ['እኔ ነኝ', 'እኔ እፈልጋለሁ', 'እኔ አያለሁ', 'እኔ እሄዳለሁ'],
        'correctAnswer': 'እኔ እፈልጋለሁ',
      },
      {
        'question': 'What is the Amharic word for "Car"?',
        'options': ['መኪና', 'ቤት', 'መንገድ', 'ትምህርት ቤት'],
        'correctAnswer': 'መኪና',
      },
      {
        'question': 'How do you say "three" in Amharic?',
        'options': ['አንድ', 'ሁለት', 'ሶስት', 'አራቴ'],
        'correctAnswer': 'ሶስት',
      },
      {
        'question': 'What is the Amharic word for "Monday"?',
        'options': ['ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'እሁድ'],
        'correctAnswer': 'ሰኞ',
      },
      {
        'question': 'What does "Ene hedalehu" mean in Amharic?',
        'options': ['እኔ አያለሁ', 'እኔ እሄዳለሁ', 'እኔ እፈልጋለሁ', 'እኔ ነኝ'],
        'correctAnswer': 'እኔ እሄዳለሁ',
      },
      {
        'question': 'What is the Amharic word for "Book"?',
        'options': ['መጽሐፍ', 'እስክርቢቶ', 'ወረቀት', 'ጠረጴዛ'],
        'correctAnswer': 'መጽሐፍ',
      },
      {
        'question': 'What is the Amharic word for "Airplane"?',
        'options': ['መኪና', 'አውሮፕላን', 'አውቶቡስ', 'ባቡር'],
        'correctAnswer': 'አውሮፕላን',
      },
      {
        'question': 'What is the Amharic word for "School"?',
        'options': ['ትምህርት ቤት', 'መምህር', 'ትምህርት', 'መጽሐፍ'],
        'correctAnswer': 'ትምህርት ቤት',
      },
      {
        'question':
            'What is the correct Amharic sentence for "I am a student"?',
        'options': ['እኔ ተማሪ ነኝ', 'ተማሪ እኔ ነኝ', 'እኔ ተማሪ እየ', 'ተማሪ ነኝ እኔ'],
        'correctAnswer': 'እኔ ተማሪ ነኝ',
      },
      {
        'question': 'What is the Amharic word for "Tuesday"?',
        'options': ['ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'እሁድ'],
        'correctAnswer': 'ማክሰኞ',
      },
      // 10 new Amharic questions
      {
        'question': 'What is the Amharic word for "Teacher"?',
        'options': ['ተማሪ', 'መምህር', 'ትምህርት', 'መጽሐፍ'],
        'correctAnswer': 'መምህር',
      },
      {
        'question': 'How do you say "four" in Amharic?',
        'options': ['አምስት', 'ሶስት', 'አራት', 'ሁለት'],
        'correctAnswer': 'አራት',
      },
      {
        'question': 'What is the Amharic word for "Wednesday"?',
        'options': ['ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'እሁድ'],
        'correctAnswer': 'ረቡዕ',
      },
      {
        'question': 'What does "Ene ayalehu" mean in Amharic?',
        'options': ['እኔ እፈልጋለሁ', 'እኔ እሄዳለሁ', 'እኔ አያለሁ', 'እኔ ነኝ'],
        'correctAnswer': 'እኔ አያለሁ',
      },
      {
        'question': 'What is the Amharic word for "Paper"?',
        'options': ['መጽሐፍ', 'ወረቀት', 'እስክርቢቶ', 'ጠረጴዛ'],
        'correctAnswer': 'ወረቀት',
      },
      {
        'question':
            'What is the appropriate Amharic response to "Ameseginalehu" (Thank you)?',
        'options': ['አመሰግናለሁ', 'ምንም አይደለም', 'ሰላም', 'ደህና ነኝ'],
        'correctAnswer': 'ምንም አይደለም',
      },
      {
        'question': 'How do you say "seven" in Amharic?',
        'options': ['አምስት', 'ሰባት', 'አስር', 'ሶስት'],
        'correctAnswer': 'ሰባት',
      },
      {
        'question': 'What is the Amharic word for "Pen"?',
        'options': ['መጽሐፍ', 'ወረቀት', 'እስክርቢቶ', 'ጠረጴዛ'],
        'correctAnswer': 'እስክርቢቶ',
      },
      {
        'question': 'What is the correct Amharic question for "Where are you?"',
        'options': ['አንተ የት ነህ?', 'የት ነህ አንተ?', 'አንተ የት ነህ ነው?', 'የት ነህ?'],
        'correctAnswer': 'የት ነህ?',
      },
      {
        'question': 'What is the Amharic word for "Sunday"?',
        'options': ['ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'እሁድ'],
        'correctAnswer': 'እሁድ',
      },
      // Add more questions (at least 5 for "Question X/5")
    ],
    SupportedLanguage.oromiffa: [
      {
        'question': 'What is the Oromiffa translation of "Good evening"?',
        'options': ['Akkam', 'Maalif?', 'Galatooma', 'Nagaan Galaa'],
        'correctAnswer': 'Nagaan Galaa',
      },
      {
        'question': 'What is the Oromiffa translation of "Thank you"?',
        'options': ['Akkam', 'Galatooma', 'Garaa', 'Eeyyee'],
        'correctAnswer': 'Galatooma',
      },
      // 18 new Oromiffa questions with English prompts
      {
        'question': 'What is the Oromiffa word for "Hello"?',
        'options': ['Akkam', 'Nagaatti', 'Galatooma', 'Maalif?'],
        'correctAnswer': 'Akkam',
      },
      {
        'question': 'What is the Oromiffa word for "Please"?',
        'options': ['Galatooma', 'Maalif?', 'Fayyaa', 'Naaf'],
        'correctAnswer': 'Naaf',
      },
      {
        'question': 'How do you say "five" in Oromiffa?',
        'options': ['Shan', 'Lama', 'Kudha', 'Tokko'],
        'correctAnswer': 'Shan',
      },
      {
        'question':
            'What is the appropriate response to "Akkam bulte" (Good morning) in Oromiffa?',
        'options': ['Galatooma', 'Nagaan jira', 'Akkam', 'Nagaatti'],
        'correctAnswer': 'Nagaan jira',
      },
      {
        'question': 'What is the Oromiffa word for "Lesson"?',
        'options': ['Mana Barumsaa', 'Barataa', 'Barnoota', 'Kitaaba'],
        'correctAnswer': 'Barnoota',
      },
      {
        'question': 'What is the Oromiffa word for "Goodbye"?',
        'options': ['Akkam', 'Nagaatti', 'Galatooma', 'Nagaan jira'],
        'correctAnswer': 'Nagaatti',
      },
      {
        'question': 'How do you say "ten" in Oromiffa?',
        'options': ['Shan', 'Kudha', 'Sadii', 'Dhibba'],
        'correctAnswer': 'Kudha',
      },
      {
        'question': 'What is the Oromiffa word for "Water"?',
        'options': ['Nyaata', 'Bishaan', 'Mana', 'Meekina'],
        'correctAnswer': 'Bishaan',
      },
      {
        'question':
            'What is the appropriate response to "Akkam jirta?" (How are you?) in Oromiffa?',
        'options': ['Galatooma', 'Nagaan jira', 'Akkam', 'Nagaatti'],
        'correctAnswer': 'Nagaan jira',
      },
      {
        'question': 'What is the Oromiffa word for "Food"?',
        'options': ['Nyaata', 'Bishaan', 'Uffata', 'Kitaaba'],
        'correctAnswer': 'Nyaata',
      },
      {
        'question': 'How do you say "two" in Oromiffa?',
        'options': ['Tokko', 'Lama', 'Sadii', 'Afur'],
        'correctAnswer': 'Lama',
      },
      {
        'question': 'What is the Oromiffa word for "House"?',
        'options': ['Mana Barumsaa', 'Mana', 'Meekina', 'Karaa'],
        'correctAnswer': 'Mana',
      },
      {
        'question': 'What does "Ana barbaada" mean in Oromiffa?',
        'options': ['Ana jira', 'Ana barbaada', 'Ana arga', 'Ana deema'],
        'correctAnswer': 'Ana barbaada',
      },
      {
        'question': 'What is the Oromiffa word for "Car"?',
        'options': ['Meekina', 'Mana', 'Karaa', 'Mana Barumsaa'],
        'correctAnswer': 'Meekina',
      },
      {
        'question': 'How do you say "three" in Oromiffa?',
        'options': ['Tokko', 'Lama', 'Sadii', 'Afur'],
        'correctAnswer': 'Sadii',
      },
      {
        'question': 'What is the Oromiffa word for "Friday"?',
        'options': ['Jimaata', 'Kamiisa', 'Sanbata', 'Dilbata'],
        'correctAnswer': 'Jimaata',
      },
      {
        'question': 'What does "Ana deema" mean in Oromiffa?',
        'options': ['Ana arga', 'Ana deema', 'Ana barbaada', 'Ana jira'],
        'correctAnswer': 'Ana deema',
      },
      {
        'question': 'What is the Oromiffa word for "Book"?',
        'options': ['Kitaaba', 'Warqee', 'Qalamii', 'Teepii'],
        'correctAnswer': 'Kitaaba',
      },
      // Add more questions
    ],
    SupportedLanguage.tigrigna: [
      {
        'question': 'What is the Tigrigna translation of "Good evening"?',
        'options': ['ሰላም', 'ከመይ ኢኻ?', 'ኣንታ ሓው?', 'ጤና ይሃበልካ'],
        'correctAnswer': 'ጤና ይሃበልካ',
      },
      {
        'question': 'What is the Tigrigna translation of "Thank you"?',
        'options': ['የቐንየለይ', 'ሰላም', 'እሺ', 'ኣይፋል'],
        'correctAnswer': 'የቐንየለይ',
      },
      // 18 new Tigrigna questions with English prompts
      {
        'question': 'What is the Tigrigna word for "Hello"?',
        'options': ['ሰላም', 'ቻው', 'የቐንየለይ', 'በጃኹም'],
        'correctAnswer': 'ሰላም',
      },
      {
        'question': 'What is the Tigrigna word for "Please"?',
        'options': ['የቐንየለይ', 'በጃኹም', 'ደሓን ቀኒኻ', 'ቻው'],
        'correctAnswer': 'በጃኹም',
      },
      {
        'question': 'How do you say "five" in Tigrigna?',
        'options': ['ሓሙሽተ', 'ክልተ', 'ዓሰርተ', 'ሓደ'],
        'correctAnswer': 'ሓሙሽተ',
      },
      {
        'question':
            'What is the appropriate response to "Dehan qenika" (Good morning) in Tigrigna?',
        'options': ['የቐንየለይ', 'ደሓን እየ', 'ሰላም', 'ቻው'],
        'correctAnswer': 'ደሓን እየ',
      },
      {
        'question': 'What is the Tigrigna word for "Lesson"?',
        'options': ['ቤት ትምህርቲ', 'መምህር', 'ትምህርቲ', 'መጽሐፍ'],
        'correctAnswer': 'ትምህርቲ',
      },
      {
        'question': 'What is the Tigrigna word for "Goodbye"?',
        'options': ['ሰላም', 'ቻው', 'የቐንየለይ', 'በጃኹም'],
        'correctAnswer': 'ቻው',
      },
      {
        'question': 'How do you say "ten" in Tigrigna?',
        'options': ['ሓሙሽተ', 'ዓሰርተ', 'ክልተ', 'ሓደ'],
        'correctAnswer': 'ዓሰርተ',
      },
      {
        'question': 'What is the Tigrigna word for "Water"?',
        'options': ['ምግቢ', 'ማይ', 'ገዛ', 'መኪና'],
        'correctAnswer': 'ማይ',
      },
      {
        'question':
            'What is the appropriate response to "Kemey ika?" (How are you?) in Tigrigna?',
        'options': ['የቐንየለይ', 'ደሓን እየ', 'ሰላም', 'ቻው'],
        'correctAnswer': 'ደሓን እየ',
      },
      {
        'question': 'What is the Tigrigna word for "Food"?',
        'options': ['ምግቢ', 'ማይ', 'ልብሲ', 'መጽሐፍ'],
        'correctAnswer': 'ምግቢ',
      },
      {
        'question': 'How do you say "two" in Tigrigna?',
        'options': ['ሓደ', 'ክልተ', 'ሰለስተ', 'ኣርባዕተ'],
        'correctAnswer': 'ክልተ',
      },
      {
        'question': 'What is the Tigrigna word for "House"?',
        'options': ['ቤት ትምህርቲ', 'ገዛ', 'መኪና', 'መገዲ'],
        'correctAnswer': 'ገዛ',
      },
      {
        'question': 'What does "Ane delye" mean in Tigrigna?',
        'options': ['ኣነ እየ', 'ኣነ ደልየ', 'ኣነ እርኢ', 'ኣነ እኸይድ'],
        'correctAnswer': 'ኣነ ደልየ',
      },
      {
        'question': 'What is the Tigrigna word for "Car"?',
        'options': ['መኪና', 'ገዛ', 'መገዲ', 'ቤት ትምህርቲ'],
        'correctAnswer': 'መኪና',
      },
      {
        'question': 'How do you say "three" in Tigrigna?',
        'options': ['ሓደ', 'ክልተ', 'ሰለስተ', 'ኣርባዕተ'],
        'correctAnswer': 'ሰለስተ',
      },
      {
        'question': 'What is the Tigrigna word for "Monday"?',
        'options': ['ሰኑይ', 'ሰሉስ', 'ሓሙስ', 'ቀዳም'],
        'correctAnswer': 'ሰኑይ',
      },
      {
        'question': 'What does "Ane ikheyid" mean in Tigrigna?',
        'options': ['ኣነ እርኢ', 'ኣነ እኸይድ', 'ኣነ ደልየ', 'ኣነ እየ'],
        'correctAnswer': 'ኣነ እኸይድ',
      },
      {
        'question': 'What is the Tigrigna word for "Book"?',
        'options': ['መጽሐፍ', 'እስክሪብቶ', 'ወረቐት', 'ጣውላ'],
        'correctAnswer': 'መጽሐፍ',
      },
      // Add more questions
    ],
    SupportedLanguage.english: [
      {
        'question': 'What is the Tigrigna translation of "Good evening"?',
        'options': ['Selam', 'Kemey Ika?', 'Anta Haw?', 'Tena Yihabelka'],
        'correctAnswer': 'Tena Yihabelka',
      },
      {
        'question': 'What is the Tigrigna translation of "Thank you"?',
        'options': ['Yekenyeley', 'Selam', 'Ishi', 'Ayfal'],
        'correctAnswer': 'Yekenyeley',
      },
      {
        'question': 'What is the Tigrigna word for "Hello"?',
        'options': ['Selam', 'Chaw', 'Yekenyeley', 'Bejakhum'],
        'correctAnswer': 'Selam',
      },
      {
        'question': 'What is the Tigrigna word for "Please"?',
        'options': ['Yekenyeley', 'Bejakhum', 'Dehan Qenika', 'Chaw'],
        'correctAnswer': 'Bejakhum',
      },
      {
        'question': 'How do you say "five" in Tigrigna?',
        'options': ['Hamushite', 'Kilite', 'Asertte', 'Hade'],
        'correctAnswer': 'Hamushite',
      },
      {
        'question':
            'What is the appropriate response to "Dehan Qenika" (Good morning) in Tigrigna?',
        'options': ['Yekenyeley', 'Dehan Eye', 'Selam', 'Chaw'],
        'correctAnswer': 'Dehan Eye',
      },
      {
        'question': 'What is the Tigrigna word for "Lesson"?',
        'options': ['Bet Timhirti', 'Memhir', 'Timhirti', 'Metshaf'],
        'correctAnswer': 'Timhirti',
      },
      {
        'question': 'What is the Tigrigna word for "Goodbye"?',
        'options': ['Selam', 'Chaw', 'Yekenyeley', 'Bejakhum'],
        'correctAnswer': 'Chaw',
      },
      {
        'question': 'How do you say "ten" in Tigrigna?',
        'options': ['Hamushite', 'Asertte', 'Kilite', 'Hade'],
        'correctAnswer': 'Asertte',
      },
      {
        'question': 'What is the Tigrigna word for "Water"?',
        'options': ['Migbi', 'May', 'Geza', 'Mekina'],
        'correctAnswer': 'May',
      },
      {
        'question':
            'What is the appropriate response to "Kemey Ika?" (How are you?) in Tigrigna?',
        'options': ['Yekenyeley', 'Dehan Eye', 'Selam', 'Chaw'],
        'correctAnswer': 'Dehan Eye',
      },
      {
        'question': 'What is the Tigrigna word for "Food"?',
        'options': ['Migbi', 'May', 'Libsi', 'Metshaf'],
        'correctAnswer': 'Migbi',
      },
      {
        'question': 'How do you say "two" in Tigrigna?',
        'options': ['Hade', 'Kilite', 'Seleste', 'Arbaite'],
        'correctAnswer': 'Kilite',
      },
      {
        'question': 'What is the Tigrigna word for "House"?',
        'options': ['Bet Timhirti', 'Geza', 'Mekina', 'Megedi'],
        'correctAnswer': 'Geza',
      },
      {
        'question': 'What does "Ane Delye" mean in Tigrigna?',
        'options': ['Ane Eye', 'Ane Delye', 'Ane Ir’i', 'Ane Ikheyid'],
        'correctAnswer': 'Ane Delye',
      },
      {
        'question': 'What is the Tigrigna word for "Car"?',
        'options': ['Mekina', 'Geza', 'Megedi', 'Bet Timhirti'],
        'correctAnswer': 'Mekina',
      },
      {
        'question': 'How do you say "three" in Tigrigna?',
        'options': ['Hade', 'Kilite', 'Seleste', 'Arbaite'],
        'correctAnswer': 'Seleste',
      },
      {
        'question': 'What is the Tigrigna word for "Monday"?',
        'options': ['Senuy', 'Selus', 'Hamus', 'Qedam'],
        'correctAnswer': 'Senuy',
      },
      {
        'question': 'What does "Ane Ikheyid" mean in Tigrigna?',
        'options': ['Ane Ir’i', 'Ane Ikheyid', 'Ane Delye', 'Ane Eye'],
        'correctAnswer': 'Ane Ikheyid',
      },
      {
        'question': 'What is the Tigrigna word for "Book"?',
        'options': ['Metshaf', 'Iskirbito', 'Wereqet', 'Tawla'],
        'correctAnswer': 'Metshaf',
      },
      // 5 new Tigrigna questions
      {
        'question': 'What is the Tigrigna word for "School"?',
        'options': ['Bet Timhirti', 'Memhir', 'Timhirti', 'Metshaf'],
        'correctAnswer': 'Bet Timhirti',
      },
      {
        'question': 'How do you say "four" in Tigrigna?',
        'options': ['Seleste', 'Arbaite', 'Hamushite', 'Kilite'],
        'correctAnswer': 'Arbaite',
      },
      {
        'question': 'What is the Tigrigna word for "Teacher"?',
        'options': ['Temari', 'Memhir', 'Timhirti', 'Metshaf'],
        'correctAnswer': 'Memhir',
      },
      {
        'question':
            'What is the appropriate Tigrigna response to "Yekenyeley" (Thank you)?',
        'options': ['Yekenyeley', 'Ayfal', 'Selam', 'Dehan Eye'],
        'correctAnswer': 'Ayfal',
      },
      {
        'question': 'What is the Tigrigna word for "Tuesday"?',
        'options': ['Senuy', 'Selus', 'Hamus', 'Qedam'],
        'correctAnswer': 'Selus',
      },
    ],
    SupportedLanguage.english: [
      // 15 previous English questions
      {
        'question': 'What is the Amharic word for "Please"?',
        'options': ['Ameseginalehu', 'Ibakih', 'Dehna Indemin Aderk', 'Chaw'],
        'correctAnswer': 'Ibakih',
      },
      {
        'question': 'What is the Oromiffa word for "Hello"?',
        'options': ['Akkam', 'Nagaatti', 'Galatooma', 'Maalif'],
        'correctAnswer': 'Akkam',
      },
      {
        'question': 'What is the Tigrigna word for "Goodbye"?',
        'options': ['Selam', 'Chaw', 'Yekenyeley', 'Bejakhum'],
        'correctAnswer': 'Chaw',
      },
      {
        'question': 'What is the Amharic word for "Water"?',
        'options': ['Migib', 'Wuhha', 'Bet', 'Mekina'],
        'correctAnswer': 'Wuhha',
      },
      {
        'question': 'What is the Oromiffa word for "Good morning"?',
        'options': ['Akkam bulte', 'Nagaan galaa', 'Galatooma', 'Nagaatti'],
        'correctAnswer': 'Akkam bulte',
      },
      {
        'question': 'What is the Tigrigna word for "Thank you"?',
        'options': ['Yekenyeley', 'Selam', 'Ishi', 'Ayfal'],
        'correctAnswer': 'Yekenyeley',
      },
      {
        'question': 'What is the Amharic word for "House"?',
        'options': ['Timhirt Bet', 'Bet', 'Mekina', 'Menged'],
        'correctAnswer': 'Bet',
      },
      {
        'question': 'What is the Oromiffa word for "Food"?',
        'options': ['Nyaata', 'Bishaan', 'Uffata', 'Kitaaba'],
        'correctAnswer': 'Nyaata',
      },
      {
        'question': 'What is the Tigrigna word for "Lesson"?',
        'options': ['Bet Timhirti', 'Memhir', 'Timhirti', 'Metshaf'],
        'correctAnswer': 'Timhirti',
      },
      {
        'question': 'What is the Amharic word for "Car"?',
        'options': ['Mekina', 'Bet', 'Menged', 'Timhirt Bet'],
        'correctAnswer': 'Mekina',
      },
      {
        'question': 'What is the Oromiffa word for "Please"?',
        'options': ['Galatooma', 'Maalif', 'Fayyaa', 'Naaf'],
        'correctAnswer': 'Naaf',
      },
      {
        'question': 'What is the Tigrigna word for "Water"?',
        'options': ['Migbi', 'May', 'Geza', 'Mekina'],
        'correctAnswer': 'May',
      },
      {
        'question': 'What is the Amharic word for "Goodbye"?',
        'options': ['Selam', 'Chaw', 'Ameseginalehu', 'Ibakih'],
        'correctAnswer': 'Chaw',
      },
      {
        'question': 'What is the Oromiffa word for "House"?',
        'options': ['Mana Barumsaa', 'Mana', 'Meekina', 'Karaa'],
        'correctAnswer': 'Mana',
      },
      {
        'question': 'What is the Tigrigna word for "Hello"?',
        'options': ['Selam', 'Chaw', 'Yekenyeley', 'Bejakhum'],
        'correctAnswer': 'Selam',
      },
      // 10 new English questions
      {
        'question': 'What is the Amharic word for "Teacher"?',
        'options': ['Temari', 'Memhir', 'Timhirt', 'Metshaf'],
        'correctAnswer': 'Memhir',
      },
      {
        'question': 'What is the Oromiffa word for "School"?',
        'options': ['Mana Barumsaa', 'Barataa', 'Barnoota', 'Kitaaba'],
        'correctAnswer': 'Mana Barumsaa',
      },
      {
        'question': 'What is the Tigrigna word for "School"?',
        'options': ['Bet Timhirti', 'Memhir', 'Timhirti', 'Metshaf'],
        'correctAnswer': 'Bet Timhirti',
      },
      {
        'question': 'How do you say "four" in Amharic?',
        'options': ['Sost', 'Arat', 'Amist', 'Hulet'],
        'correctAnswer': 'Arat',
      },
      {
        'question': 'How do you say "four" in Oromiffa?',
        'options': ['Sadii', 'Afur', 'Shan', 'Lama'],
        'correctAnswer': 'Afur',
      },
      {
        'question': 'How do you say "four" in Tigrigna?',
        'options': ['Seleste', 'Arbaite', 'Hamushite', 'Kilite'],
        'correctAnswer': 'Arbaite',
      },
      {
        'question':
            'What is the Amharic response to "Ameseginalehu" (Thank you)?',
        'options': ['Ameseginalehu', 'Minnim Aydellem', 'Selam', 'Dehna Negn'],
        'correctAnswer': 'Minnim Aydellem',
      },
      {
        'question': 'What is the Oromiffa response to "Galatooma" (Thank you)?',
        'options': ['Galatooma', 'Hin oolu', 'Akkam', 'Nagaan jira'],
        'correctAnswer': 'Hin oolu',
      },
      {
        'question':
            'What is the Tigrigna response to "Yekenyeley" (Thank you)?',
        'options': ['Yekenyeley', 'Ayfal', 'Selam', 'Dehan Eye'],
        'correctAnswer': 'Ayfal',
      },
      {
        'question': 'What is the Oromiffa word for "Teacher"?',
        'options': ['Barataa', 'Barsiisaa', 'Barnoota', 'Kitaaba'],
        'correctAnswer': 'Barsiisaa',
      },
      // Add more questions
    ],
  };
}

Map<String, Object> getTranslationDictionary(
  SupportedLanguage source,
  SupportedLanguage target,
) {
  final translations = {
    'english_amharic': {
      'hello': 'ሰላም',
      'thank you': 'አመሰግናለሁ',
      'goodbye': 'ቻው',
      'good morning': 'ደህና እንደምን አደርክ',
      'please': 'እባክህ',
    },
    'amharic_english': {
      'ሰላም': 'hello',
      'አመሰግናለሁ': 'thank you',
      'ቻው': 'goodbye',
      'ደህና እንደምን አደርክ': 'good morning',
      'እባክህ': 'please',
    },
    'english_oromiffa': {
      'hello': 'akkam',
      'thank you': 'galatooma',
      'goodbye': 'nagaatti',
      'good morning': 'akkam bulte',
      'please': 'maaltu',
    },
    'oromiffa_english': {
      'akkam': 'hello',
      'galatooma': 'thank you',
      'nagaatti': 'goodbye',
      'akkam bulte': 'good morning',
      'maaltu': 'please',
    },
    'english_tigrigna': {
      'hello': 'ሰላም',
      'thank you': 'የቐንየለይ',
      'goodbye': 'ቻው',
      'good morning': 'ደሓን ቀኒኻ',
      'please': 'በጃኹም',
    },
    'tigrigna_english': {
      'ሰላም': 'hello',
      'የቐንየለይ': 'thank you',
      'ቻው': 'goodbye',
      'ደሓን ቀኒኻ': 'good morning',
      'በጃኹም': 'please',
    },
  };

  String key = '${source.name}_${target.name}';
  return translations[key] ?? {};
}

Map<SupportedLanguage, List<Map<String, String>>> getAudioLessons() {
  return {
    SupportedLanguage.amharic: [
      {
        'title': 'ሰላምታ በአማርኛ',
        'audioUrl': 'assets/audio/amharic_greetings.mp3',
        'description': 'መሰረታዊ የአማርኛ ሰላምታዎችን ተማር።',
      },
      {
        'title': 'የአማርኛ ቁጥሮች',
        'audioUrl': 'assets/audio/amharic_numbers.mp3',
        'description': 'ከ1 እስከ 10 መቁጠር በአማርኛ።',
      },
    ],
    SupportedLanguage.oromiffa: [
      {
        'title': 'Jechaalee Afaan Oromoo',
        'audioUrl': 'assets/audio/oromiffa_phrases.mp3',
        'description': 'Jechaalee barbaachisoo Afaan Oromoo keessatti.',
      },
      {
        'title': 'Lakkoobsa Afaan Oromoo',
        'audioUrl': 'assets/audio/oromiffa_numbers.mp3',
        'description': 'Lakkoobsa 1 hanga 10 Afaan Oromoo keessatti.',
      },
    ],
    SupportedLanguage.tigrigna: [
      {
        'title': 'ሰላምታ ብትግርኛ',
        'audioUrl': 'assets/audio/tigrigna_greetings.mp3',
        'description': 'ሰላምታታት መሰረታዊ ብትግርኛ ተምር።',
      },
      {
        'title': 'ቁጽሪ ብትግርኛ',
        'audioUrl': 'assets/audio/tigrigna_numbers.mp3',
        'description': 'ካብ 1 ክሳብ 10 ቁጽሪ ብትግርኛ።',
      },
    ],
    SupportedLanguage.english: [
      {
        'title': 'Amharic Greetings',
        'audioUrl': 'assets/audio/amharic_greetings.mp3',
        'description': 'Learn basic Amharic greetings.',
      },
      {
        'title': 'Oromiffa Phrases',
        'audioUrl': 'assets/audio/oromiffa_phrases.mp3',
        'description': 'Essential phrases in Oromiffa.',
      },
      {
        'title': 'Tigrigna Numbers',
        'audioUrl': 'assets/audio/tigrigna_numbers.mp3',
        'description': 'Counting from 1 to 10 in Tigrigna.',
      },
    ],
  };
}

Map<String, dynamic> getTranslations(SupportedLanguage lang) {
  switch (lang) {
    case SupportedLanguage.amharic:
      return {
        'appBarTitleTranslate': 'ተርጉም',
        'comingSoon': 'በቅርቡ ይመጣል!',
        'comingSoonMessage': 'ይህ ባህሪ በማደግ ላይ ነው። ተጠንቀቅ!',
        "appBarTitleContact": "እኛን ያግኙ",
        "contactUs": "እኛን ያግኙ",
        "fullNameLabel": "ሙሉ ስም",
        "fullNameHint": "ሙሉ ስምዎን ያስገቡ",
        "emailLabel": "ኢሜይል አድራሻ",
        "emailHint": "ኢሜይልዎን ያስገቡ",
        "messageLabel": "መልእክትዎ",
        "messageHint": "መልእክትዎን ወይም ጥያቄዎን እዚህ ይፃፉ...",
        "sendMessage": "መልእክት ላክ",
        "nameError": "እባክዎ ስምዎን ያስገቡ",
        "emailError": "እባክዎ ኢሜይልዎን ያስገቡ",
        "emailInvalid": "እባክዎ ትክክለኛ ኢሜይል ያስገቡ",
        "messageError": "እባክዎ መልእክትዎን ያስገቡ",
        "messageTooShort": "መልእክት ቢያንስ 10 ፊደሎች መሆን አለበት",
        "sendingMessage": "መልእክትዎን በመላክ ላይ...",
        "messageSent": "መልእክት ተልኳል!",
        "formError": "እባክዎ በቅጹ ላይ ያሉትን ስህተቶች ያስተካክሉ።",
        "appBarTitleAudioLessons": "የድምጽ ትምህርቶች",
        "playButton": "አጫውት",
        "pauseButton": "አቁም",
        "audioError": "የድምጽ ፋይል መጫን አልተሳካም።",
        // Dashboard translations
        "appName": "የቋንቋ ተማሪ",
        "home": "ቤት",
        "welcome": "እንኳን ደህና መጡ!",
        "letsLearn": "ዛሬ የተወሰነ አማርኛ እንማር!",
        "yourProgress": "የእርስዎ ሂደት",
        "overall": "አጠቃላይ:",
        "lessonsCompleted": "ያጠናቀቋቸው ትምህርቶች:",
        "dailyGoal": "የዕለቱ ግብ:",
        "wordsLearned": "የተማሯቸው ቃላት",
        "commonPhrases": "የተለመዱ ሀረጎች",
        "greetings": "ሰላምታዎች",
        "numbers": "ቁጥሮች",
        "food": "ምግብ",
        "exploreFeatures": "ባህሪያትን ያስሱ",
        "lessons": "ትምህርቶች",
        "quizzes": "ፈተናዎች",
        "audioPractice": "የድምፅ ልምምድ",
        "translate": "ተርጉም",
        "dashboard": "ዳሽቦርድ",
        "dictionary": "መዝገበ ቃላት",
        "practice": "ልምምድ",
        "audioLessons": "የድምፅ ትምህርቶች",
        "settings": "ቅንብሮች",
        "contactUs": "ያግኙን",
        "signOut": "ውጣ",
        // LoginPage translations
        "appBarTitleSignIn": "ይግቡ",
        "welcomeSignIn": "እንኳን ደህና መጡ!",
        "loginContinue": "ለመቀጠል ይግቡ!",
        "emailLabel": "ኢሜይል",
        "emailHint": "የኢሜል አድራሻዎን ያስገቡ",
        "passwordLabel": "የይለፍ ቃል",
        "passwordHint": "የይለፍ ቃልዎን ያስገቡ",
        "forgotPassword": "የይለፍ ቃል ረስተዋል?",
        "signInButton": "ይግቡ",
        "orDivider": "ወይም",
        "facebookButton": "Facebook",
        "googleButton": "Google",
        "noAccount": "መለያ የለዎትም? ",
        "signUpLink": "ይመዝገቡ",
        "enterEmail": "እባክዎ ኢሜይል ያስገቡ",
        "validEmail": "ትክክለኛ የኢሜይል አድራሻ ያስገቡ",
        "enterPassword": "እባክዎ የይለፍ ቃል ያስገቡ",
        "passwordLength": "የይለፍ ቃል ቢያንስ 6 ቁምፊዎች መሆን አለበት።",
        "languageSet": "የበይነገጽ ቋንቋ ወደ {lang} ተቀይሯል",
        // SignUp translations
        "appBarTitleSignUp": "ይመዝገቡ",
        "createAccount": "መለያዎን ይፍጠሩ",
        "fullNameLabel": "ሙሉ ስም",
        "fullNameHint": "ሙሉ ስምዎን ያስገቡ",
        "confirmPasswordLabel": "የይለፍ ቃል አረጋግጥ",
        "confirmPasswordHint": "የይለፍ ቃልዎን እንደገና ያስገቡ",
        "signUpButton": "ይመዝገቡ",
        "alreadyHaveAccount": "መለያ አለዎት? ",
        "signInLink": "ይግቡ",
        "passwordCriteria": "የይለፍ ቃል 6+ ቁምፊዎች፣ ፊደሎች እና ቁጥሮች/ምልክቶች መሆን አለበት።",
        "enterFullName": "እባክዎ ሙሉ ስምዎን ያስገቡ",
        "fullNameLength": "ሙሉ ስም ከ4 ቁምፊዎች በላይ መሆን አለበት።",
        "confirmPassword": "እባክዎ የይለፍ ቃልዎን ያረጋግጡ",
        "passwordsNoMatch": "የይለፍ ቃላት አይዛመዱም።",
        "signUpSuccess": "ምዝገባ ተሳክቷል! ወደ መግቢያ ገጽ በመምራት ላይ...",
        // HomePage translations
        "appBarTitleHome": "ቋንቋዎችን በደስታ ይማሩ!",
        "welcomeHome": "ወደ ቋንቋዎች መማር እንኳን ደህና መጡ!",
        "exploreDescription": "በይነተገናኝ ትምህርቶች፣ ፈተናዎች እና ፈተናዎች ያስሱ!",
        "selectLanguage": "ቋንቋ ይምረጡ",
        "didYouKnow": "ያውቃሉ?",
        "dailyWord": "የዕለቱ ቃል",
        "translation": "ተርጉም",
        "guessTranslation": "ተርጉሙን ገምቱ!",
        "enterGuess": "ግምትዎን ያስገቡ",
        "checkGuess": "ግምትን ያረጋግጡ",
        "correctGuess": "ትክክል! ጎበዝ!",
        "incorrectGuess": "ተሳስቷል። እንደገና ይሞክሩ!",
        "startLearning": "መማር ይጀምሩ!",
        "selectLanguagePrompt": "ለመማር ቋንቋ ይምረጡ።",
        "languageFactDefault": "አስደሳች እውነታ ለመማር ቋንቋ ይምረጡ!",
        "quote": "ቋንቋ መማር ዓለምን ለመመልከት አንድ ተጨማሪ መስኮት መኖር ነው።",
        "appBarTitleQuizzes": "ፈተናዎች",
        "questionLabel": "ጥያቄ",
        "submitButton": "አስገባ",
        "correctAnswer": "ትክክል!",
        "correctMessage": "በትክክል መልሰዋል!",
        "incorrectAnswer": "ተሳስቷል!",
        "incorrectMessage": "ይቅርታ፣ ያ ትክክል አይደለም።",
        "okButton": "እሺ",
        "quizComplete": "ፈተና ተጠናቋል! ወደ ዳሽቦርድ ተመለሱ።",
        "appBarTitleSettings": "ቅንብሮች",
        "darkMode": "ጨለማ ሁነታ",
        "offlineAccess": "ከመስመር ውጭ መዳረሻ",
        "fontSize": "የፊደል መጠን",
        "fontSizeSubtitle": "የአሁኑ መጠን: {size}",
        "about": "ስለ",
        "appName": "የቋንቋ መማሪያ መተግበሪያ",
        "appVersion": "1.0.0",
        "aboutDescription": "ይህ መተግበሪያ የኢትዮጵያ አካባቢያዊ ቋንቋዎችን ለመማር ይረዳዎታል።",
        "appBarTitleTranslate": "ተርጉም ገፅ",
        "sourceLanguage": "የመነሻ ቋንቋ",
        "targetLanguage": "የመድረሻ ቋንቋ",
        "enterText": "የሚተረጎም ጽሑፍ ያስገቡ",
        "translateButton": "ተርጉም",
        "translationNotAvailable": "ትርጉም ለእነዚህ ቋንቋዎች አይገኝም",
        "emptyInput": "እባክዎ ለመተርጎም ጽሑፍ ያስገቡ",
        "Greetings": {
          "title": "ሰላምታ",
          "description": "መሰረታዊ ሰላምታዎችን እና መግቢያዎችን ተማር",
        },
        "Conversation": {
          "title": "ውይይት",
          "description": "የውይይት ሐረጎችን እና ውይይቶችን ተለማመድ",
        },
        "Days of the Week": {
          "title": "የሳምንቱ ቀናት",
          "description": "የሳምንቱ ቀናትን እና ተዛማጅ ሰዋሰው ተማር",
        },
        "Directions": {
          "title": "አቅጣጫዎች",
          "description": "አቅጣጫ መጠየቅ እና መስጠት ተማር",
        },
        "Transportation": {
          "title": "ትራንስፖርት",
          "description": "ከትራንስፖርት ጋር የተያያዙ ቃላትን አስስ",
        },
        "Locations": {"title": "ቦታዎች", "description": "ስለ ቦታዎች እና መገኛዎች ተማር"},
        "Eating": {"title": "መመገብ", "description": "የምግብ እና የመመገቢያ ቃላትን ተማር"},
        "Numbers": {"title": "ቁጥሮች", "description": "መቁጠር እና ቁጥሮችን መጠቀም ተማር"},
        "Adjectives": {"title": "ቅጽሎች", "description": "በቅጽሎች ቃላትህን አስፋ"},
        "Food": {"title": "ምግብ", "description": "ለምግቦች እና ግብዓቶች ቃላት ተማር"},
        "Emergency": {
          "title": "ድንገተኛ ሁኔታ",
          "description": "ለድንገተኛ ሁኔታዎች ሐረጎችን ተማር",
        },
        "Medical": {"title": "ሕክምና", "description": "የሕክምና ቃላትን እና ሐረጎችን ተማር"},
        "Sport": {"title": "ስፖርት", "description": "ከስፖርት ጋር የተያያዙ ቃላትን አስስ"},
        "Fuel": {"title": "ነዳጅ", "description": "ከነዳጅ እና ኃይል ጋር የተያያዙ ቃላት ተማር"},
        "Occupations": {
          "title": "ሙያዎች",
          "description": "ለሥራዎች እና ሙያዎች ቃላትን ተማር",
        },
        "Relatives": {"title": "ዘመዶች", "description": "ለቤተሰብ እና ዘመዶች ቃላት ተማር"},
        "Body": {"title": "አካል", "description": "ለአካል ክፍሎች ቃላትን አስስ"},
        "Weather": {
          "title": "የአየር ሁኔታ",
          "description": "ከአየር ሁኔታ ጋር የተያያዙ ቃላትን እና ሐረጎችን ተማር",
        },
      };
    case SupportedLanguage.oromiffa:
      return {
        "appBarTitleContact": "Nu Qunnamuu",
        "contactUs": "Nu Qunnamuu",
        "fullNameLabel": "Maqaa Guutuu",
        "fullNameHint": "Maqaa kee guutuu galchi",
        "emailLabel": "Teessoo Imeelii",
        "emailHint": "Imeelii kee galchi",
        "messageLabel": "Ergaa Kee",
        "messageHint": "Ergaa kee ykn gaaffii kee asitti barreessi...",
        "sendMessage": "Ergaa Ergi",
        "nameError": "Mee maqaa kee galchi",
        "emailError": "Mee imeelii kee galchi",
        "emailInvalid": "Mee imeelii sirrii galchi",
        "messageError": "Mee ergaa kee galchi",
        "messageTooShort": "Ergaa kee yeroo hunda xiqqeessaa 10 ol ta'uu qaba",
        "sendingMessage": "Ergaa kee ergaa jira...",
        "messageSent": "Ergaa ergadhe!",
        "formError": "Mee furmaata keessatti dogoggora jiru sirreessi.",
        "appBarTitleAudioLessons": "Barnoota Sagalee",
        "playButton": "Dabaluu",
        "pauseButton": "Dhaabuu",
        "audioError": "Faayilii sagalee fe'umsa hin arganne.",
        // Dashboard translations
        "appName": "Barata Afaan",
        "home": "Manna",
        "welcome": "Baga Nagaan Dhuftan!",
        "letsLearn": "Har'a Afaan Oromoo haa barannu!",
        "yourProgress": "Adeemsa Keessan",
        "overall": "Waliigala:",
        "lessonsCompleted": "Barnoota Xumuraman:",
        "dailyGoal": "Kaayyoo Guyyaa:",
        "wordsLearned": "Jechoota Baratte",
        "commonPhrases": "Gaaleewwan Baramoo",
        "greetings": "Nagaa Gaaffii",
        "numbers": "Lakkoofsota",
        "food": "Nyaata",
        "exploreFeatures": "Amaloota Sakatta'i",
        "lessons": "Barnoota",
        "quizzes": "Qormaata",
        "audioPractice": "Shaakala Sagalee",
        "translate": "Hiiki",
        "dashboard": "Daashboordii",
        "dictionary": "Galmee Jechoota",
        "practice": "Shaakala",
        "audioLessons": "Barnoota Sagalee",
        "settings": "Qindaa'ina",
        "contactUs": "Nu Qunnama",
        "signOut": "Ba'uu",
        // LoginPage translations
        "appBarTitleSignIn": "Seeni",
        "welcomeSignIn": "Baga Nagaan Dhuftan!",
        "loginContinue": "Itti fufuuf seeni!",
        "emailLabel": "Imeelii",
        "emailHint": "Teessoo imeelii kee galchi",
        "passwordLabel": "Jecha Darbii",
        "passwordHint": "Jecha darbii kee galchi",
        "forgotPassword": "Jecha darbii irraanfattee?",
        "signInButton": "Seeni",
        "orDivider": "Yookaan",
        "facebookButton": "Facebook",
        "googleButton": "Google",
        "noAccount": "Akkaawuntii hin qabduu? ",
        "signUpLink": "Galmaa'i",
        "enterEmail": "Maaloo imeelii galchi",
        "validEmail": "Teessoo imeelii sirrii galchi",
        "enterPassword": "Maaloo jecha darbii galchi",
        "passwordLength": "J/darbiin yoo xiqqaate qubee 6 ta'uu qaba.",
        "languageSet": "Afaan interfeesii gara {lang} jijjiirameera",
        // SignUp translations
        "appBarTitleSignUp": "Galmaa'i",
        "createAccount": "Akkaawuntii Kee Uumi",
        "fullNameLabel": "Maqaa Guutuu",
        "fullNameHint": "Maqaa kee guutuu galchi",
        "confirmPasswordLabel": "Jecha Darbii Mirkaneessi",
        "confirmPasswordHint": "Jecha darbii kee irra deebi'ii galchi",
        "signUpButton": "Galmaa'i",
        "alreadyHaveAccount": "Akkaawuntii qabdaa? ",
        "signInLink": "Seeni",
        "passwordCriteria":
            "J/darbiin qubee 6+, qubee fi lakkoofsa/mallattoo qabaachuu qaba.",
        "enterFullName": "Maaloo maqaa kee guutuu galchi",
        "fullNameLength": "Maqaan guutuun qubee 4 ol ta'uu qaba.",
        "confirmPassword": "Maaloo jecha darbii kee mirkaneessi",
        "passwordsNoMatch": "Jechoonni darbii wal hin fakkaatan.",
        "signUpSuccess": "Galmeen milkaa'eera! Gara fuula seensaa geessaa...",
        // HomePage translations
        "appBarTitleHome": "Afaanota Waliin Jiraachuu!",
        "welcomeHome": "Baga Nagaan Barnoota Afaan Dhuftan!",
        "exploreDescription":
            "Barnoota waliin jiraachuu, qormaata, fi waraana qaxxaamuraa!",
        "selectLanguage": "Afaan Filadhu",
        "didYouKnow": "Sittiin Beektaa?",
        "dailyWord": "Jecha Guyyaa",
        "translation": "Hiikka",
        "guessTranslation": "Hiikkaa Gammachuu!",
        "enterGuess": "Gammachuu kee galchi",
        "checkGuess": "Gammachuu Mirkaneessi",
        "correctGuess": "Sirriidha! Gaarii!",
        "incorrectGuess": "Dogoggora. Irra deebi'i yaali!",
        "startLearning": "Barnoota Jalqabi!",
        "selectLanguagePrompt": "Barnootaaf afaan filadhu.",
        "languageFactDefault": "Afaan filadhu siif odeeffannoo xiinxalaa!",
        "quote":
            "Afaan barachuu jechuun amaloota addunyaa ilaalchuu isa kamiifuu qaba.",
        "appBarTitleQuizzes": "Qormaata",
        "questionLabel": "Gaaffii",
        "submitButton": "Galchi",
        "correctAnswer": "Sirriidha!",
        "correctMessage": "Sirriitti deebifte!",
        "incorrectAnswer": "Dogoggora!",
        "incorrectMessage": "Dhiifama, kun sirri miti.",
        "okButton": "Eeyyee",
        "quizComplete": "Qormaanni xumurame! Gara daashboordii deebi'aa.",
        "appBarTitleSettings": "Qindaa'ina",
        "darkMode": "Haala Dukkanaa",
        "offlineAccess": "Seensa Alaa",
        "fontSize": "Hammamtaa Qubee",
        "fontSizeSubtitle": "Hammamtaa ammaa: {size}",
        "about": "Waa'ee",
        "appName": "Barata Afaan App",
        "appVersion": "1.0.0",
        "aboutDescription":
            "Appiin kun afaanota naannoo Itoophiyaa barachuuf isin gargaara.",
        "appBarTitleTranslate": "Hiika Fuula",
        "sourceLanguage": "Afaan Jalqaba",
        "targetLanguage": "Afaan Itti Aanee",
        "enterText": "Barruu hiikamu galchi",
        "translateButton": "Hiiki",
        "translationNotAvailable": "Hiikni afaanota kanneef hin jiru",
        "emptyInput": "Maaloo barruu hiikamu galchi",
        "Greetings": {
          "title": "Kabaja",
          "description": "Kabaja fi ibsa jalqabaa baradhu",
        },
        "Conversation": {
          "title": "Haasaa",
          "description": "Jecha haasaa fi waa’ee haasaa baradhu",
        },
        "Days of the Week": {
          "title": "Guyyoota Torban",
          "description": "Guyyoota torban fi seerluga waliin baradhu",
        },
        "Directions": {
          "title": "Qajeelfama",
          "description": "Qajeelfama gaafachuu fi kennuu baradhu",
        },
        "Transportation": {
          "title": "Geejjiba",
          "description": "Jecha geejjibaa waliin baradhu",
        },
        "Locations": {
          "title": "Iddoowwan",
          "description": "Iddoowwan fi bakka bu’uura baradhu",
        },
        "Eating": {
          "title": "Nyaachuu",
          "description": "Jecha nyaataa fi ijaarsa nyaataa baradhu",
        },
        "Numbers": {
          "title": "Lakkoofsawwan",
          "description": "Lakkoofsuu fi lakkoofsawwan fayyadamuu baradhu",
        },
        "Adjectives": {
          "title": "Ibsa",
          "description": "Jecha ibsa waliin jechoota kee babal’isi",
        },
        "Food": {
          "title": "Nyaata",
          "description": "Jecha nyaataa fi walitti qabduu baradhu",
        },
        "Emergency": {
          "title": "Hooda",
          "description": "Jecha hooda keessatti fayyadama baradhu",
        },
        "Medical": {
          "title": "Qorichaa",
          "description": "Jecha qorichaa fi jecha qorichaa baradhu",
        },
        "Sport": {
          "title": "Ispoortii",
          "description": "Jecha ispoortii waliin baradhu",
        },
        "Fuel": {
          "title": "Diigaa",
          "description": "Jecha diigaa fi humna waliin baradhu",
        },
        "Occupations": {
          "title": "Hojii",
          "description": "Jecha hojii fi hojii baradhu",
        },
        "Relatives": {
          "title": "Firoota",
          "description": "Jecha maatii fi firoota baradhu",
        },
        "Body": {
          "title": "Qabeenya",
          "description": "Jecha qabeenya qaban waliin baradhu",
        },
        "Weather": {
          "title": "Haala Qilleensaa",
          "description": "Jecha haala qilleensaa fi jecha waliin baradhu",
        },
      };
    case SupportedLanguage.tigrigna:
      return {
        "appBarTitleContact": "ንኽትከውን ርኸቡና",
        "contactUs": "ንኽትከውን ርኸቡና",
        "fullNameLabel": "ምሉእ ስም",
        "fullNameHint": "ምሉእ ስምካ ኣተው",
        "emailLabel": "ኢመይል ኣድራሻ",
        "emailHint": "ኢመይልካ ኣተው",
        "messageLabel": "መልእኽትካ",
        "messageHint": "መልእኽትካ ወይ ሕቶካ ኣብዚ ጽሓፍ...",
        "sendMessage": "መልእኽት ስደድ",
        "nameError": "በጃኻ ስምካ ኣተው",
        "emailError": "በጃኻ ኢመይልካ ኣተው",
        "emailInvalid": "በጃኻ ቅኑዕ ኢመይል ኣተው",
        "messageError": "በጃኻ መልእኽትካ ኣተው",
        "messageTooShort": "መልእኽት ብውሑዱ 10 ፊደላት ክኸውን ኣለዎ",
        "sendingMessage": "መልእኽትካ ኣብ መልኣኽ ኣሎ...",
        "messageSent": "መልእኽት ተሰዲዱ!",
        "formError": "በጃኻ ኣብ ፎርም ዘለዉ ጌጋታት ኣርሙ።",
        "appBarTitleAudioLessons": "ትምህርቲ ድምጺ",
        "playButton": "ኣቃውም",
        "pauseButton": "ኣቋርጽ",
        "audioError": "ፋይል ድምጺ ክጫን ኣይከኣለን።",
        // Dashboard translations
        "appName": "ተማሃራይ ቋንቋ",
        "home": "ገዛ",
        "welcome": "እንኳዕ ብደሓን መጻእኩም!",
        "letsLearn": "ሎሚ ትግርኛ ንመሃር!",
        "yourProgress": "ናይ ኣኻትኩም ከይዲ",
        "overall": "ጠቕላላ:",
        "lessonsCompleted": "ዝተዛዘሙ ትምህርታት:",
        "dailyGoal": "ዕላማ ናይ መዓልቲ:",
        "wordsLearned": "ዝተመሃርካዮም ቃላት",
        "commonPhrases": "ልሙዳት ሓረጋት",
        "greetings": "ሰላምታታት",
        "numbers": "ቁጽርታት",
        "food": "ምግቢ",
        "exploreFeatures": "ባህርያት መርምር",
        "lessons": "ትምህርታት",
        "quizzes": "ፈተናታት",
        "audioPractice": "ናይ ድምጺ ልምምድ",
        "translate": "ተርጉም",
        "dashboard": "ዳሽቦርድ",
        "dictionary": "መዝገበ ቃላት",
        "practice": "ልምምድ",
        "audioLessons": "ናይ ድምጺ ትምህርታት",
        "settings": "ምቅንያት",
        "contactUs": "ምሳና ተወከሱ",
        "signOut": "ውጽእ",
        // LoginPage translations
        "appBarTitleSignIn": "እቶ",
        "welcomeSignIn": "እንኳዕ ብደሓን መጻእኩም!",
        "loginContinue": "ንኽትቅጽል እቶ!",
        "emailLabel": "ኢመይል",
        "emailHint": "ናይ ኢመይል ኣድራሻኹም የእትዉ",
        "passwordLabel": "መሕለፊ ቓል",
        "passwordHint": "መሕለፊ ቓልኩም የእትዉ",
        "forgotPassword": "መሕለፊ ቓል ረሲዕኩም?",
        "signInButton": "እቶ",
        "orDivider": "ወይ",
        "facebookButton": "Facebook",
        "googleButton": "Google",
        "noAccount": "ሕሳብ የብልኩምን? ",
        "signUpLink": "ተመዝገብ",
        "enterEmail": "በጃኹም ኢመይል የእትዉ",
        "validEmail": "ቅኑዕ ናይ ኢመይል ኣድራሻ የእትዉ",
        "enterPassword": "በጃኹም መሕለፊ ቓል የእትዉ",
        "passwordLength": "መሕለፊ ቓል እንተወሓደ 6 ፊደላት ክኸውን ኣለዎ።",
        "languageSet": "ቋንቋ መተግበሪ ናብ {lang} ተቐይሩ",
        // SignUp translations
        "appBarTitleSignUp": "ተመዝገብ",
        "createAccount": "ናይ ባዕልኻ ሕሳብ ክፈት",
        "fullNameLabel": "ምሉእ ስም",
        "fullNameHint": "ምሉእ ሽምኩም የእትዉ",
        "confirmPasswordLabel": "መሕለፊ ቓል ኣረጋግጽ",
        "confirmPasswordHint": "መሕለፊ ቓልኩም መሊስኩም የእትዉ",
        "signUpButton": "ተመዝገብ",
        "alreadyHaveAccount": "ቀደም ሕሳብ ኣለኩም ድዩ? ",
        "signInLink": "እቶ",
        "passwordCriteria": "መሕለፊ ቓል 6+ ፊደላት፣ ፊደላትን ቁጽርን/ምልክትን ክህልዎ ኣለዎ።",
        "enterFullName": "በጃኹም ምሉእ ሽምኩም የእትዉ",
        "fullNameLength": "ምሉእ ስም ካብ 4 ፊደላት ንላዕሊ ክኸውን ኣለዎ።",
        "confirmPassword": "በጃኹም መሕለፊ ቓልኩም ኣረጋግጹ",
        "passwordsNoMatch": "መሕለፊ ቓላት ኣይመሳሰሉን።",
        "signUpSuccess": "ምዝገባ ተሳኺዑ! ናብ መእተዊ ገጽ እናመርሐ...",
        // HomePage translations
        "appBarTitleHome": "ቋንቋታት ብድሓን ተምሃር!",
        "welcomeHome": "ናብ ትምህርቲ ቋንቋታት ብደሓን መጻእኩም!",
        "exploreDescription": "ተዘዋዋሪ ትምህርታት፣ ፈተናታትን ብድሆታትን ምርምር!",
        "selectLanguage": "ቋንቋ ምረጽ",
        "didYouKnow": "ትፈልጥ ዶ?",
        "dailyWord": "ናይ መዓልቲ ቃል",
        "translation": "ትርጉም",
        "guessTranslation": "ትርጉም ግምት!",
        "enterGuess": "ግምትካ ኣእቱ",
        "checkGuess": "ግምት ምርግጋጽ",
        "correctGuess": "ቅኑዕ! ጽቡቕ ፈጻሚ!",
        "incorrectGuess": "ጌጋ። ዳግም ፈትን!",
        "startLearning": "ትምህርቲ ጀምር!",
        "selectLanguagePrompt": "ንትምህርቲ ቋንቋ ምረጽ።",
        "languageFactDefault": "ቋንቋ ምረጽ ንመሃር ዝደስክል ሓቅን!",
        "quote": "ቋንቋ ምምሃር ናብ ዓለም ንምድሃብ ተወሳኺ መስኮት ምሓዝ እዩ።",
        "appBarTitleQuizzes": "ፈተናታት",
        "questionLabel": "ሕቶ",
        "submitButton": "ኣቅርብ",
        "correctAnswer": "ቅኑዕ!",
        "correctMessage": "ብትኽክል መሊስካ!",
        "incorrectAnswer": "ጌጋ!",
        "incorrectMessage": "ይቕሬታ፣ እዚ ቅኑዕ ኣይኮነን።",
        "okButton": "እሺ",
        "quizComplete": "ፈተና ተዛዚሙ! ናብ ዳሽቦርድ ተመለስ።",
        "appBarTitleSettings": "ምቅንያት",
        "darkMode": "ጸልማት ህንጻ",
        "offlineAccess": "ከመስመር ወጻኢ መእተዊ",
        "fontSize": "መጠን ፊደል",
        "fontSizeSubtitle": "ናይ ሕዚ መጠን: {size}",
        "about": "ብዛዕባ",
        "appName": "መተግበሪ ትምህርቲ ቋንቋ",
        "appVersion": "1.0.0",
        "aboutDescription": "እዚ መተግበሪ ናይ ኤርትራን ኢትዮጵያን ቋንቋታት ንምምሃር ይሕግዘካ።",
        "appBarTitleTranslate": "ትርጉም ገፅ",
        "sourceLanguage": "መበገሲ ቋንቋ",
        "targetLanguage": "መዕለቢ ቋንቋ",
        "enterText": "ጽሑፍ ንምትርጓም ኣእቱ",
        "translateButton": "ተርጉም",
        "translationNotAvailable": "ትርጉም ነዚ ቋንቋታት ኣይገኝን",
        "emptyInput": "በጃኹም ጽሑፍ ንምትርጓም ኣእቱ",
        "Greetings": {
          "title": "ሰላምታ",
          "description": "ሰላምታት መሰረታዊ ከምኡውን መግቢ ተመሃር",
        },
        "Conversation": {"title": "ዕላል", "description": "ሐረግ ዕላልን ውይይትን ምለማመድ"},
        "Days of the Week": {
          "title": "መዓልታት ሰሙን",
          "description": "መዓልታት ሰሙንን ተዛማድን ሰዋስው ተመሃር",
        },
        "Directions": {"title": "ኣንፈት", "description": "ኣንፈት ምሕታትን ምሃብን ተመሃር"},
        "Transportation": {
          "title": "መጓዓዝያ",
          "description": "ቃላት መጓዓዝያ ዝምልከት ምርመራ",
        },
        "Locations": {"title": "ቦታታት", "description": "ቦታታትን መገናኛታትን ተመሃር"},
        "Eating": {"title": "ምግቢ", "description": "ቃላት መግብን መመገብን ተመሃር"},
        "Numbers": {"title": "ቁጽሪ", "description": "ምቁጻርን ቁጽርታት ምጥቃምን ተመሃር"},
        "Adjectives": {
          "title": "ቅንጣት ገሳጺ",
          "description": "ብቅንጣት ገሳጺ ቃላትካ ምስፋሕ",
        },
        "Food": {"title": "መግቢ", "description": "ቃላት መግብን ንጥፈታትን ተመሃር"},
        "Emergency": {"title": "ናውቲ", "description": "ሐረጋት ንናውቲ ኩነታት ተመሃር"},
        "Medical": {"title": "ሕክምና", "description": "ቃላትን ሐረጋትን ሕክምና ተመሃር"},
        "Sport": {"title": "ስፖርት", "description": "ቃላት ስፖርት ዝምልከት ምርመራ"},
        "Fuel": {"title": "ነዳዲ", "description": "ቃላት ነዳዲን ጉልበትን ተመሃር"},
        "Occupations": {"title": "ስራሕ", "description": "ቃላት ስራሕን ሞያታትን ተመሃር"},
        "Relatives": {"title": "ዘመድ", "description": "ቃላት ስድራቤትን ዘመድን ተመሃር"},
        "Body": {"title": "ሰብነት", "description": "ቃላት ንኽፍልታት ሰብነት ምርመራ"},
        "Weather": {
          "title": "ኩነታት ኣየር",
          "description": "ቃላትን ሐረጋትን ኩነታት ኣየር ተመሃር",
        },
      };
    case SupportedLanguage.english:
    default:
      return {
        'appBarTitleTranslate': 'Translate',
        'comingSoon': 'Coming Soon!',
        'comingSoonMessage': 'This feature is under development. Stay tuned!',
        "appBarTitleContact": "Contact Us",
        "contactUs": "Contact Us",
        "fullNameLabel": "Full Name",
        "fullNameHint": "Enter your full name",
        "emailLabel": "Email Address",
        "emailHint": "Enter your email",
        "messageLabel": "Your Message",
        "messageHint": "Write your comment or question here...",
        "sendMessage": "Send Message",
        "nameError": "Please enter your name",
        "emailError": "Please enter your email",
        "emailInvalid": "Please enter a valid email address",
        "messageError": "Please enter your message",
        "messageTooShort": "Message should be at least 10 characters",
        "sendingMessage": "Sending your message...",
        "messageSent": "Message sent!",
        "formError": "Please fix the errors in the form.",
        "appBarTitleAudioLessons": "Audio Lessons",
        "playButton": "Play",
        "pauseButton": "Pause",
        "audioError": "Failed to load audio file.",
        // Dashboard translations
        "appName": "Language Learner",
        "home": "Home",
        "welcome": "Welcome Back!",
        "letsLearn": "Let's learn some English today!",
        "yourProgress": "Your Progress",
        "overall": "Overall:",
        "lessonsCompleted": "Lessons Completed:",
        "dailyGoal": "Daily Goal:",
        "wordsLearned": "Words Learned",
        "commonPhrases": "Common Phrases",
        "greetings": "Greetings",
        "numbers": "Numbers",
        "food": "Food",
        "exploreFeatures": "Explore Features",
        "lessons": "Interactive Lessons",
        "quizzes": "Take Quizzes",
        "audioPractice": "Audio Practice",
        "translate": "Translate",
        "dashboard": "Dashboard",
        "dictionary": "Dictionary",
        "practice": "Practice",
        "audioLessons": "Audio Lessons",
        "settings": "Settings",
        "contactUs": "Contact Us",
        "signOut": "Sign Out",
        // LoginPage translations
        "appBarTitleSignIn": "Sign In",
        "welcomeSignIn": "Hello, Welcome back!",
        "loginContinue": "Login to Continue!",
        "emailLabel": "Email",
        "emailHint": "Enter your email address",
        "passwordLabel": "Password",
        "passwordHint": "Enter your password",
        "forgotPassword": "Forgot Password?",
        "signInButton": "Sign In",
        "orDivider": "OR",
        "facebookButton": "Facebook",
        "googleButton": "Google",
        "noAccount": "Don't have an account? ",
        "signUpLink": "Sign Up",
        "enterEmail": "Please enter your email",
        "validEmail": "Enter a valid email address",
        "enterPassword": "Please enter your password",
        "passwordLength": "Password must be at least 6 characters",
        "languageSet": "Interface language set to {lang}",
        // SignUp translations
        "appBarTitleSignUp": "Sign Up",
        "createAccount": "Create Your Account",
        "fullNameLabel": "Full Name",
        "fullNameHint": "Enter your full name",
        "confirmPasswordLabel": "Confirm Password",
        "confirmPasswordHint": "Re-enter your password",
        "signUpButton": "Sign Up",
        "alreadyHaveAccount": "Already have an account? ",
        "signInLink": "Sign In",
        "passwordCriteria":
            "Password must be 6+ chars, with letters and numbers/symbols",
        "enterFullName": "Please enter your full name",
        "fullNameLength": "Full name must be more than 4 characters",
        "confirmPassword": "Please confirm your password",
        "passwordsNoMatch": "Passwords do not match",
        "signUpSuccess": "Sign Up Successful! Redirecting to Login...",
        // HomePage translations
        "appBarTitleHome": "Learn Languages the Fun Way!",
        "welcomeHome": "Welcome to Learning Languages!",
        "exploreDescription":
            "Explore interactive lessons, quizzes, and challenges!",
        "selectLanguage": "Select Language",
        "didYouKnow": "Did You Know?",
        "dailyWord": "Daily Word",
        "translation": "Translation",
        "guessTranslation": "Guess the Translation!",
        "enterGuess": "Enter your guess",
        "checkGuess": "Check Guess",
        "correctGuess": "Correct! Well done!",
        "incorrectGuess": "Incorrect. Try again!",
        "startLearning": "Start Learning!",
        "selectLanguagePrompt": "Please select a language to start learning.",
        "languageFactDefault":
            "Select a language to learn an interesting fact!",
        "quote":
            "To learn a language is to have one more window from which to look at the world.",
        "appBarTitleQuizzes": "Quizzes",
        "questionLabel": "Question",
        "submitButton": "Submit",
        "correctAnswer": "Correct!",
        "correctMessage": "You got it right!",
        "incorrectAnswer": "Incorrect!",
        "incorrectMessage": "Sorry, that's not correct.",
        "okButton": "OK",
        "quizComplete": "Quiz completed! Return to Dashboard.",
        "appBarTitleSettings": "Settings",
        "darkMode": "Dark Mode",
        "offlineAccess": "Offline Access",
        "fontSize": "Font Size",
        "fontSizeSubtitle": "Current size: {size}",
        "about": "About",
        "appName": "Language Learning App",
        "appVersion": "1.0.0",
        "aboutDescription":
            "This app is designed to help you learn local Ethiopian languages.",
        // Previous translations unchanged
        "appBarTitleTranslate": "Translate Page",
        "sourceLanguage": "Source Language",
        "targetLanguage": "Target Language",
        "enterText": "Enter text to translate",
        "translateButton": "Translate",
        "translationNotAvailable":
            "Translation not available for these languages",
        "emptyInput": "Please enter text to translate",
        "Greetings": {
          "title": "Greetings",
          "description": "Learn basic greetings and introductions",
        },
        "Conversation": {
          "title": "Conversation",
          "description": "Practice conversational phrases and dialogues",
        },
        "Days of the Week": {
          "title": "Days of the Week",
          "description": "Master the days of the week and related grammar",
        },
        "Directions": {
          "title": "Directions",
          "description": "Learn how to ask for and give directions",
        },
        "Transportation": {
          "title": "Transportation",
          "description": "Explore vocabulary related to transportation",
        },
        "Locations": {
          "title": "Locations",
          "description": "Learn about places and locations",
        },
        "Eating": {
          "title": "Eating",
          "description": "Master food and dining vocabulary",
        },
        "Numbers": {
          "title": "Numbers",
          "description": "Learn to count and use numbers",
        },
        "Adjectives": {
          "title": "Adjectives",
          "description": "Expand your vocabulary with adjectives",
        },
        "Food": {
          "title": "Food",
          "description": "Learn vocabulary for foods and ingredients",
        },
        "Emergency": {
          "title": "Emergency",
          "description": "Master phrases for emergency situations",
        },
        "Medical": {
          "title": "Medical",
          "description": "Learn medical terms and phrases",
        },
        "Sport": {
          "title": "Sport",
          "description": "Explore sports-related vocabulary",
        },
        "Fuel": {
          "title": "Fuel",
          "description": "Learn terms related to fuel and energy",
        },
        "Occupations": {
          "title": "Occupations",
          "description": "Master vocabulary for jobs and professions",
        },
        "Relatives": {
          "title": "Relatives",
          "description": "Learn terms for family and relatives",
        },
        "Body": {
          "title": "Body",
          "description": "Explore vocabulary for body parts",
        },
        "Weather": {
          "title": "Weather",
          "description": "Learn weather-related terms and phrases",
        },
      };
  }
}

Map<String, Map<String, String>> getLessonTranslations(SupportedLanguage lang) {
  switch (lang) {
    case SupportedLanguage.amharic:
      return {
        "Greetings": {
          "title": "ሰላምታ",
          "description": "መሰረታዊ ሰላምታዎችን እና መግቢያዎችን ተማር",
        },
        "Conversation": {
          "title": "ውይይት",
          "description": "የውይይት ሐረጎችን እና ውይይቶችን ተለማመድ",
        },
        "Days of the Week": {
          "title": "የሳምንቱ ቀናት",
          "description": "የሳምንቱ ቀናትን እና ተዛማጅ ሰዋሰው ተማር",
        },
        "Directions": {
          "title": "አቅጣጫዎች",
          "description": "አቅጣጫ መጠየቅ እና መስጠት ተማር",
        },
        "Transportation": {
          "title": "ትራንስፖርት",
          "description": "ከትራንስፖርት ጋር የተያያዙ ቃላትን አስስ",
        },
        "Locations": {"title": "ቦታዎች", "description": "ስለ ቦታዎች እና መገኛዎች ተማር"},
        "Eating": {"title": "መመገብ", "description": "የምግብ እና የመመገቢያ ቃላትን ተማር"},
        "Numbers": {"title": "ቁጥሮች", "description": "መቁጠር እና ቁጥሮችን መጠቀም ተማር"},
        "Adjectives": {"title": "ቅጽሎች", "description": "በቅጽሎች ቃላትህን አስፋ"},
        "Food": {"title": "ምግብ", "description": "ለምግቦች እና ግብዓቶች ቃላት ተማር"},
        "Emergency": {
          "title": "ድንገተኛ ሁኔታ",
          "description": "ለድንገተኛ ሁኔታዎች ሐረጎችን ተማር",
        },
        "Medical": {"title": "ሕክምና", "description": "የሕክምና ቃላትን እና ሐረጎችን ተማር"},
        "Sport": {"title": "ስፖርት", "description": "ከስፖርት ጋር የተያያዙ ቃላትን አስስ"},
        "Fuel": {"title": "ነዳጅ", "description": "ከነዳጅ እና ኃይል ጋር የተያያዙ ቃላት ተማር"},
        "Occupations": {
          "title": "ሙያዎች",
          "description": "ለሥራዎች እና ሙያዎች ቃላትን ተማር",
        },
        "Relatives": {"title": "ዘመዶች", "description": "ለቤተሰብ እና ዘመዶች ቃላት ተማር"},
        "Body": {"title": "አካል", "description": "ለአካል ክፍሎች ቃላትን አስስ"},
        "Weather": {
          "title": "የአየር ሁኔታ",
          "description": "ከአየር ሁኔታ ጋር የተያያዙ ቃላትን እና ሐረጎችን ተማር",
        },
      };
    case SupportedLanguage.oromiffa:
      return {
        "Greetings": {
          "title": "Kabaja",
          "description": "Kabaja fi ibsa jalqabaa baradhu",
        },
        "Conversation": {
          "title": "Haasaa",
          "description": "Jecha haasaa fi waa’ee haasaa baradhu",
        },
        "Days of the Week": {
          "title": "Guyyoota Torban",
          "description": "Guyyoota torban fi seerluga waliin baradhu",
        },
        "Directions": {
          "title": "Qajeelfama",
          "description": "Qajeelfama gaafachuu fi kennuu baradhu",
        },
        "Transportation": {
          "title": "Geejjiba",
          "description": "Jecha geejjibaa waliin baradhu",
        },
        "Locations": {
          "title": "Iddoowwan",
          "description": "Iddoowwan fi bakka bu’uura baradhu",
        },
        "Eating": {
          "title": "Nyaachuu",
          "description": "Jecha nyaataa fi ijaarsa nyaataa baradhu",
        },
        "Numbers": {
          "title": "Lakkoofsawwan",
          "description": "Lakkoofsuu fi lakkoofsawwan fayyadamuu baradhu",
        },
        "Adjectives": {
          "title": "Ibsa",
          "description": "Jecha ibsa waliin jechoota kee babal’isi",
        },
        "Food": {
          "title": "Nyaata",
          "description": "Jecha nyaataa fi walitti qabduu baradhu",
        },
        "Emergency": {
          "title": "Hooda",
          "description": "Jecha hooda keessatti fayyadama baradhu",
        },
        "Medical": {
          "title": "Qorichaa",
          "description": "Jecha qorichaa fi jecha qorichaa baradhu",
        },
        "Sport": {
          "title": "Ispoortii",
          "description": "Jecha ispoortii waliin baradhu",
        },
        "Fuel": {
          "title": "Diigaa",
          "description": "Jecha diigaa fi humna waliin baradhu",
        },
        "Occupations": {
          "title": "Hojii",
          "description": "Jecha hojii fi hojii baradhu",
        },
        "Relatives": {
          "title": "Firoota",
          "description": "Jecha maatii fi firoota baradhu",
        },
        "Body": {
          "title": "Qabeenya",
          "description": "Jecha qabeenya qaban waliin baradhu",
        },
        "Weather": {
          "title": "Haala Qilleensaa",
          "description": "Jecha haala qilleensaa fi jecha waliin baradhu",
        },
      };
    case SupportedLanguage.tigrigna:
      return {
        "Greetings": {
          "title": "ሰላምታ",
          "description": "ሰላምታት መሰረታዊ ከምኡውን መግቢ ተመሃር",
        },
        "Conversation": {"title": "ዕላል", "description": "ሐረግ ዕላልን ውይይትን ምለማመድ"},
        "Days of the Week": {
          "title": "መዓልታት ሰሙን",
          "description": "መዓልታት ሰሙንን ተዛማድን ሰዋስው ተመሃር",
        },
        "Directions": {"title": "ኣንፈት", "description": "ኣንፈት ምሕታትን ምሃብን ተመሃር"},
        "Transportation": {
          "title": "መጓዓዝያ",
          "description": "ቃላት መጓዓዝያ ዝምልከት ምርመራ",
        },
        "Locations": {"title": "ቦታታት", "description": "ቦታታትን መገናኛታትን ተመሃር"},
        "Eating": {"title": "ምግቢ", "description": "ቃላት መግብን መመገብን ተመሃር"},
        "Numbers": {
          "title": "ቁጽሪ",
          "description":
              "ምቁጻርን ቁጽ Telecommunications Ltd. v. Bell Atlantic Corp.",
        },
      };
    case SupportedLanguage.english:
    default:
      return {
        "Greetings": {
          "title": "Greetings",
          "description": "Learn basic greetings and introductions",
        },
        "Conversation": {
          "title": "Conversation",
          "description": "Practice conversational phrases and dialogues",
        },
        "Days of the Week": {
          "title": "Days of the Week",
          "description": "Master the days of the week and related grammar",
        },
        "Directions": {
          "title": "Directions",
          "description": "Learn how to ask for and give directions",
        },
        "Transportation": {
          "title": "Transportation",
          "description": "Explore vocabulary related to transportation",
        },
        "Locations": {
          "title": "Locations",
          "description": "Learn about places and locations",
        },
        "Eating": {
          "title": "Eating",
          "description": "Master food and dining vocabulary",
        },
        "Numbers": {
          "title": "Numbers",
          "description": "Learn to count and use numbers",
        },
        "Adjectives": {
          "title": "Adjectives",
          "description": "Expand your vocabulary with adjectives",
        },
        "Food": {
          "title": "Food",
          "description": "Learn vocabulary for foods and ingredients",
        },
        "Emergency": {
          "title": "Emergency",
          "description": "Master phrases for emergency situations",
        },
        "Medical": {
          "title": "Medical",
          "description": "Learn medical terms and phrases",
        },
        "Sport": {
          "title": "Sport",
          "description": "Explore sports-related vocabulary",
        },
        "Fuel": {
          "title": "Fuel",
          "description": "Learn terms related to fuel and energy",
        },
        "Occupations": {
          "title": "Occupations",
          "description": "Master vocabulary for jobs and professions",
        },
        "Relatives": {
          "title": "Relatives",
          "description": "Learn terms for family and relatives",
        },
        "Body": {
          "title": "Body",
          "description": "Explore vocabulary for body parts",
        },
        "Weather": {
          "title": "Weather",
          "description": "Learn weather-related terms and phrases",
        },
      };
  }
}
