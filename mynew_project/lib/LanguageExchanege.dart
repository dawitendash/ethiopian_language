import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/firstpage.dart';
import 'package:provider/provider.dart';

import '../hompage/locale_provider.dart';
import '../models/supported_language.dart';
import '../theme_provider.dart';

class LanguageExchangePage extends StatefulWidget {
  const LanguageExchangePage({Key? key}) : super(key: key);

  @override
  _LanguageExchangePageState createState() => _LanguageExchangePageState();
}

class _LanguageExchangePageState extends State<LanguageExchangePage> {
  final List<Map<String, String>> users = [
    {
      'name': 'Abebe Kebede',
      'languageLearning': 'English',
      'languageSpeaking': 'Amharic',
      'bio':
          'Learning English to connect with the world. Native Amharic speaker.',
    },
    {
      'name': 'Fatuma Mohammed',
      'languageLearning': 'Amharic',
      'languageSpeaking': 'Oromiffa',
      'bio': 'Interested in learning Amharic culture. Fluent in Oromiffa.',
    },
    {
      'name': 'John Smith',
      'languageLearning': 'Amharic',
      'languageSpeaking': 'English',
      'bio':
          'Trying to learn Amharic for my travels. Happy to help with English.',
    },
  ];

  void _navigateToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashbord()),
    );
  }

  void _showChatDialog(
    BuildContext context,
    String userName,
    Map<String, dynamic> translations,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.all(20),
          backgroundColor: Colors.transparent,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.green[50]!, Colors.yellow[50]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translations['chatWith']?.replaceAll('{user}', userName) ??
                      'Chat with $userName',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Divider(color: Colors.green, height: 20),
                Text(
                  translations['chatNotImplemented'] ??
                      'Chat functionality is not yet implemented. Requires backend integration.',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      translations['closeButton'] ?? 'Close',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final translations = getTranslations(localeProvider.language);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations['appBarTitleLanguageExchange'] ?? 'Language Exchange',
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
        leading: IconButton(
          onPressed: _navigateToDashboard,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient:
              isDarkMode
                  ? null
                  : LinearGradient(
                    colors: [Colors.green[50]!, Colors.yellow[50]!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              users.isEmpty
                  ? Center(
                    child: Text(
                      translations['noUsers'] ?? 'No users available.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  )
                  : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [
                                isDarkMode ? Colors.grey[800]! : Colors.white,
                                isDarkMode
                                    ? Colors.grey[800]!
                                    : Colors.yellow[50]!,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isDarkMode
                                          ? Colors.white
                                          : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${translations['learning'] ?? 'Learning'}: ${user['languageLearning']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      isDarkMode
                                          ? Colors.grey[300]
                                          : Colors.grey[700],
                                ),
                              ),
                              Text(
                                '${translations['speaking'] ?? 'Speaking'}: ${user['languageSpeaking']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      isDarkMode
                                          ? Colors.grey[300]
                                          : Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                user['bio']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      isDarkMode
                                          ? Colors.grey[300]
                                          : Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showChatDialog(
                                      context,
                                      user['name']!,
                                      translations,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[800],
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    translations['chatButton'] ?? 'Chat',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
