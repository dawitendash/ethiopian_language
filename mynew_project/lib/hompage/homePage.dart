import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/firstpage.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:provider/provider.dart';

import '../models/supported_language.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _backgroundColor = Colors.white;
  List<Color> _backgroundColors = [
    Colors.white,
    Colors.blue[100]!,
    Colors.green[100]!,
    Colors.yellow[100]!,
  ];
  int _colorIndex = 0;
  Timer? _timer;
  String _dailyWord = '';
  String _dailyWordTranslation = '';
  TextEditingController _guessController = TextEditingController();
  String _guessResult = '';
  String _languageFact = '';

  @override
  void initState() {
    super.initState();
    _startBackgroundColorAnimation();
    _loadDailyWordAndFact();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _guessController.dispose();
    super.dispose();
  }

  void _startBackgroundColorAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _backgroundColors.length;
        _backgroundColor = _backgroundColors[_colorIndex];
      });
    });
  }

  void _loadDailyWordAndFact() {
    final language =
        Provider.of<LocaleProvider>(context, listen: false).language;
    String word, translation, fact;
    switch (language) {
      case SupportedLanguage.amharic:
        word = 'ሰላም'; // Selam
        translation = 'Hello';
        fact =
            'Amharic is the official language of Ethiopia and is written using a unique script called Ge\'ez.';
        break;
      case SupportedLanguage.oromiffa:
        word = 'akkam'; // Akkam
        translation = 'Hello';
        fact =
            'Oromo is the most widely spoken language in the Cushitic branch of the Afro-Asiatic language family.';
        break;
      case SupportedLanguage.tigrigna:
        word = 'ሰላም'; // Selam
        translation = 'Hello';
        fact =
            'Tigrinya is spoken in Eritrea and Ethiopia and uses the same Ge\'ez script as Amharic.';
        break;
      case SupportedLanguage.english:
      default:
        word = 'Hello';
        translation = 'ሰላም/akkam/ሰላም';
        fact = 'Select a language to learn an interesting fact!';
        break;
    }
    setState(() {
      _dailyWord = word;
      _dailyWordTranslation = translation;
      _languageFact = fact;
      _guessResult = '';
      _guessController.clear();
    });
  }

  void _checkGuess() {
    final translations = getTranslations(
      Provider.of<LocaleProvider>(context, listen: false).language,
    );
    String guess = _guessController.text.trim();
    if (guess.toLowerCase() == _dailyWordTranslation.toLowerCase()) {
      setState(() {
        _guessResult = translations['correctGuess'] ?? 'Correct! Well done!';
      });
    } else {
      setState(() {
        _guessResult =
            translations['incorrectGuess'] ?? 'Incorrect. Try again!';
      });
    }
  }

  void _handleStartLearning() {
    final language =
        Provider.of<LocaleProvider>(context, listen: false).language;
    final translations = getTranslations(language);
    if (language != SupportedLanguage.english) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashbord()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            translations['selectLanguagePrompt'] ??
                'Please select a language to start learning.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final translations = getTranslations(localeProvider.language);
    final bool isButtonEnabled =
        localeProvider.language != SupportedLanguage.english;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations['appBarTitleHome'] ?? 'Learn Languages the Fun Way!',
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      backgroundColor: _backgroundColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  translations['welcomeHome'] ??
                      'Welcome to Learning Languages!',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  translations['exploreDescription'] ??
                      'Explore interactive lessons, quizzes, and challenges!',
                  style: const TextStyle(fontSize: 17, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
                DropdownButtonFormField<SupportedLanguage>(
                  decoration: InputDecoration(
                    labelText:
                        translations['selectLanguage'] ?? 'Select Language',
                    border: const OutlineInputBorder(),
                  ),
                  value: localeProvider.language,
                  items:
                      SupportedLanguage.values.map((SupportedLanguage lang) {
                        String imagePath;
                        switch (lang) {
                          case SupportedLanguage.amharic:
                            imagePath = 'assets/flags/amhara.png';
                            break;
                          case SupportedLanguage.oromiffa:
                            imagePath = 'assets/flags/oromia.png';
                            break;
                          case SupportedLanguage.tigrigna:
                            imagePath = 'assets/flags/Tigray.png';
                            break;
                          case SupportedLanguage.english:
                            imagePath = 'assets/flags/english.png';
                            break;
                        }
                        return DropdownMenuItem<SupportedLanguage>(
                          value: lang,
                          child: Row(
                            children: [
                              Image.asset(imagePath, width: 24, height: 24),
                              const SizedBox(width: 8),
                              Text(getLanguageDisplayName(lang)),
                            ],
                          ),
                        );
                      }).toList(),
                  onChanged: (SupportedLanguage? newValue) {
                    if (newValue != null) {
                      localeProvider.setLocale(newValue);
                      _loadDailyWordAndFact();
                    }
                  },
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translations['didYouKnow'] ?? 'Did You Know?',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _languageFact,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translations['dailyWord'] ?? 'Daily Word',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _dailyWord,
                          style: const TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${translations['translation'] ?? 'Translation'}: $_dailyWordTranslation',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translations['guessTranslation'] ??
                              'Guess the Translation!',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _guessController,
                          decoration: InputDecoration(
                            labelText:
                                translations['enterGuess'] ??
                                'Enter your guess',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _checkGuess,
                          child: Text(
                            translations['checkGuess'] ?? 'Check Guess',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _guessResult,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: isButtonEnabled ? _handleStartLearning : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isButtonEnabled
                            ? Colors.deepPurple
                            : Colors.grey.shade400,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 18,
                    ),
                    elevation: isButtonEnabled ? 5 : 0,
                  ),
                  child: Text(
                    translations['startLearning'] ?? 'Start Learning!',
                    style: const TextStyle(fontSize: 19),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  translations['quote'] ??
                      '"To learn a language is to have one more window from which to look at the world."',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
