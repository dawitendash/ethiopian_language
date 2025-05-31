import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/firstpage.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:mynew_project/models/supported_language.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashbord()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: const [
                WelcomePage(),
                LanguageSelectionPage(),
                GetStartedPage(),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton(
                      onPressed:
                          () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                  Row(
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color:
                              _currentPage == index
                                  ? Colors.deepPurple
                                  : Colors.grey[400],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _completeOnboarding();
                      }
                    },
                    child: Text(
                      _currentPage == 2 ? 'Get Started' : 'Next',
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepPurple.shade100, Colors.white],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.book_rounded, size: 100, color: Colors.deepPurple),
          const SizedBox(height: 24),
          const Text(
            'Welcome to Ethiopia Learn! 🇪🇹',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              fontFamily: 'NotoSansEthiopic',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Master Amharic, Oromo, Tigrinya, and English with culturally rich lessons.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontFamily: 'NotoSansEthiopic',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Image.asset("assets/images/eti.webp", height: 150, fit: BoxFit.cover),
        ],
      ),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Choose Your Language 🌍',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              fontFamily: 'NotoSansEthiopic',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Select a language to start learning.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontFamily: 'NotoSansEthiopic',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          LanguageCard(
            language: 'Amharic',
            emoji: '🇪🇹',
            description: 'Official language of Ethiopia, spoken by millions.',
            onTap:
                () => localeProvider.setLocale(
                  const Locale('am') as SupportedLanguage,
                ),
          ),
          LanguageCard(
            language: 'Oromo',
            emoji: '🌾',
            description: 'Widely spoken in Ethiopia and parts of Kenya.',
            onTap:
                () => localeProvider.setLocale(
                  const Locale('om') as SupportedLanguage,
                ),
          ),
          LanguageCard(
            language: 'Tigrinya',
            emoji: '🦒',
            description: 'Spoken in Tigray and Eritrea, rich in history.',
            onTap:
                () => localeProvider.setLocale(
                  const Locale('ti') as SupportedLanguage,
                ),
          ),
          LanguageCard(
            language: 'English',
            emoji: '🌐',
            description: 'Global language for broader communication.',
            onTap:
                () =>
                    localeProvider.setLocale(Locale('en') as SupportedLanguage),
          ),
        ],
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final String language;
  final String emoji;
  final String description;
  final VoidCallback onTap;

  const LanguageCard({
    Key? key,
    required this.language,
    required this.emoji,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Text(emoji, style: const TextStyle(fontSize: 24)),
        title: Text(
          language,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'NotoSansEthiopic',
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 14, fontFamily: 'NotoSansEthiopic'),
        ),
        onTap: onTap,
      ),
    );
  }
}

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepPurple.shade100, Colors.white],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.celebration_rounded,
            size: 100,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 24),
          const Text(
            'Ready to Learn! 🎉',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              fontFamily: 'NotoSansEthiopic',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Dive into interactive lessons and cultural insights.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontFamily: 'NotoSansEthiopic',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isFirstTime', false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Dashbord()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSansEthiopic',
              ),
            ),
            child: const Text('Start Learning'),
          ),
        ],
      ),
    );
  }
}
