import 'package:flutter/material.dart';
import 'package:mynew_project/LanguageExchanege.dart';
import 'package:mynew_project/contact.dart';
import 'package:mynew_project/hompage/DictionaryScreen.dart';
import 'package:mynew_project/hompage/audioLessonsPage.dart';
import 'package:mynew_project/hompage/learn.dart';
import 'package:mynew_project/hompage/quizzesPage.dart';
import 'package:mynew_project/hompage/settings.dart';
import 'package:mynew_project/hompage/sign_in.dart';
import 'package:mynew_project/models/supported_language.dart';
import 'package:provider/provider.dart';

import 'locale_provider.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  int _selectiveindex = 0;
  double _overallProgress = 0.35;
  int _lessonsCompleted = 5;
  int _totalLessons = 20;
  int _dailyGoalWords = 10;
  int _wordsLearnedToday = 3;

  void navigateBottomBar(int index) {
    setState(() {
      _selectiveindex = index;
    });
    Widget nextPage;
    switch (index) {
      case 1:
        nextPage = const LessonsScreen(fullName: "User");
        break;
      case 2:
        nextPage = const DictionaryScreen();
        break;
      case 3:
        nextPage = const LanguageExchangePage();
        break;
      case 0:
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
  }

  void signOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  final List<String> _titles = ["Dashboard", "Lessons", "Quizzes", "Practice"];

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icon, size: 40.0, color: color),
                const SizedBox(height: 10.0),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLanguageSelected(SupportedLanguage selected, BuildContext context) {
    Provider.of<LocaleProvider>(context, listen: false).setLocale(selected);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Language set to ${getLanguageDisplayName(selected)}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildPhraseChip(String label, {VoidCallback? onPressed}) {
    return ActionChip(
      label: Text(label),
      avatar: Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.blueGrey[600],
      ),
      backgroundColor: Colors.blueGrey[50],
      onPressed:
          onPressed ??
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigate to "$label" phrases')),
            );
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final SupportedLanguage selectedLanguage = localeProvider.language;
    final Map<String, dynamic> translations = getTranslations(selectedLanguage);
    final String languageDisplayName = getLanguageDisplayName(selectedLanguage);

    final List<IconData> _navIcons = [
      Icons.dashboard_outlined,
      Icons.school_outlined,
      Icons.book_sharp,
      Icons.headset_mic_outlined,
    ];

    final List<IconData> _navActiveIcons = [
      Icons.dashboard,
      Icons.school,
      Icons.quiz,
      Icons.headset_mic,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations[_titles[_selectiveindex].toLowerCase()] ??
              _titles[_selectiveindex],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[800],
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green[800]!, Colors.yellow[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<SupportedLanguage>(
            icon: const Icon(Icons.language, color: Colors.white),
            tooltip: "Select Language",
            onSelected: (language) => _onLanguageSelected(language, context),
            itemBuilder: (BuildContext context) {
              return SupportedLanguage.values.map((SupportedLanguage choice) {
                return PopupMenuItem<SupportedLanguage>(
                  value: choice,
                  child: Text(getLanguageDisplayName(choice)),
                );
              }).toList();
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        width: 300,
        backgroundColor: Colors.green[50],
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[800]!, Colors.yellow[600]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: const AssetImage(
                      "assets/images/WDU_logo.png",
                    ),
                    backgroundColor: Colors.transparent,
                    onBackgroundImageError: (exception, stackTrace) {
                      print('Error loading drawer header image: $exception');
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    translations['appName'] ?? "Language Learner",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined, color: Colors.green[800]),
              title: Text(
                translations['home'] ?? "HOME",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.green[800],
                ),
              ),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder:()),
                // );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.record_voice_over_outlined,
                color: Colors.green[800],
              ),
              title: Text(
                translations['audioLessons'] ?? "AUDIO LESSONS",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.green[800],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Audiolessonspage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined, color: Colors.green[800]),
              title: Text(
                translations['settings'] ?? "SETTINGS",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.green[800],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_support_outlined,
                color: Colors.green[800],
              ),
              title: Text(
                translations['contactUs'] ?? "CONTACT US",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.green[800],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
            const Spacer(),
            Divider(height: 1, thickness: 1, color: Colors.green[800]),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red.shade700),
              title: Text(
                translations['signOut'] ?? "SIGN OUT",
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                signOut();
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[50]!, Colors.yellow[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translations['welcome'] ?? 'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  translations['letsLearn'] ??
                      "Let's learn some $languageDisplayName today!",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
                const SizedBox(height: 25.0),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.yellow[50]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translations['yourProgress'] ?? 'Your Progress',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                translations['overall'] ?? 'Overall:',
                                style: const TextStyle(fontSize: 15.0),
                              ),
                              Text(
                                "${(_overallProgress * 100).toStringAsFixed(0)}%",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          LinearProgressIndicator(
                            value: _overallProgress,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.green[800]!,
                            ),
                            minHeight: 6.0,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "${translations['lessonsCompleted'] ?? 'Lessons Completed:'} $_lessonsCompleted / $_totalLessons",
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.yellow[50]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.flag_outlined,
                            color: Colors.green[800],
                            size: 28,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translations['dailyGoal'] ?? 'Daily Goal:',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "$_wordsLearnedToday / $_dailyGoalWords words",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CircularProgressIndicator(
                            value: _wordsLearnedToday / _dailyGoalWords,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.green[800]!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text(
                  translations['exploreFeatures'] ?? 'Explore Features',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 15.0),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    _buildDashboardCard(
                      icon: Icons.school_outlined,
                      title: translations['lessons'] ?? 'Interactive Lessons',
                      color: Colors.green[800]!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const LessonsScreen(fullName: "User"),
                          ),
                        );
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.book_sharp,
                      title: translations['quizzes'] ?? 'Take Quizzes',
                      color: Colors.green[800]!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Quizzespage(),
                          ),
                        );
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.volume_up_outlined,
                      title: translations['audioPractice'] ?? 'Audio Practice',
                      color: Colors.green[800]!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Audiolessonspage(),
                          ),
                        );
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.translate,
                      title: translations['translate'] ?? 'Translate',
                      color: Colors.green[800]!,
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const TranslatePage(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.yellow[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.green[800],
          unselectedItemColor: Colors.grey,
          currentIndex: _selectiveindex,
          onTap: navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform:
                    Matrix4.identity()..scale(_selectiveindex == 0 ? 1.2 : 1.0),
                child: Icon(
                  _selectiveindex == 0
                      ? Icons.dashboard
                      : Icons.dashboard_outlined,
                  size: 24,
                ),
              ),
              label: translations['dashboard'] ?? 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform:
                    Matrix4.identity()..scale(_selectiveindex == 1 ? 1.2 : 1.0),
                child: Icon(
                  _selectiveindex == 1 ? Icons.school : Icons.school_outlined,
                  size: 24,
                ),
              ),
              label: translations['lessons'] ?? 'Lessons',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform:
                    Matrix4.identity()..scale(_selectiveindex == 2 ? 1.2 : 1.0),
                child: Icon(
                  _selectiveindex == 2 ? Icons.quiz : Icons.book_sharp,
                  size: 24,
                ),
              ),
              label: translations['dictionary'] ?? 'Dictionary',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform:
                    Matrix4.identity()..scale(_selectiveindex == 3 ? 1.2 : 1.0),
                child: Icon(
                  _selectiveindex == 3
                      ? Icons.headset_mic
                      : Icons.headset_mic_outlined,
                  size: 24,
                ),
              ),
              label: translations['practice'] ?? 'Practice',
            ),
          ],
        ),
      ),
    );
  }
}
