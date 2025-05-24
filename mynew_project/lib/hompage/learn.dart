import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mynew_project/hompage/DictionaryScreen.dart';
import 'package:mynew_project/models/supported_language.dart';
import 'package:provider/provider.dart';

// Adjust if DictionaryScreen is not used elsewhere
import 'favorites_page.dart';
import 'locale_provider.dart';

class LessonsScreen extends StatefulWidget {
  final String fullName;
  const LessonsScreen({Key? key, required this.fullName}) : super(key: key);

  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  List<dynamic> dictionary = [];
  List<dynamic> filteredWords = [];
  String selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0; // Lessons tab selected by default
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    loadDictionary();
    _searchController.addListener(_filterWords);
  }

  Future<void> loadDictionary() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/ethiopian_dictionary.json',
      );
      final data = json.decode(response);
      setState(() {
        dictionary = data;
        filteredWords = dictionary;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load dictionary: $e';
        _isLoading = false;
      });
    }
  }

  void _filterWords() {
    final query = _searchController.text.toLowerCase();
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    final selectedLanguage = localeProvider.language;
    setState(() {
      filteredWords =
          dictionary.where((entry) {
            final word = entry['word'].toLowerCase();
            final translations = {
              'english': entry['english'].toLowerCase(),
              'amharic': entry['amharic'].toLowerCase(),
              'oromifa': entry['oromifa'].toLowerCase(),
              'tigrinya': entry['tigrinya'].toLowerCase(),
            };
            final pronunciation = entry['pronunciation'].toLowerCase();
            final matchesQuery =
                word.contains(query) ||
                translations['english']!.contains(query) ||
                translations['amharic']!.contains(query) ||
                translations['oromifa']!.contains(query) ||
                translations['tigrinya']!.contains(query) ||
                pronunciation.contains(query);
            final matchesCategory =
                selectedCategory == 'All' ||
                entry['category'] == selectedCategory;
            return matchesQuery && matchesCategory;
          }).toList();
    });
  }

  void _onLessonTapped(String category) {
    setState(() {
      selectedCategory = category;
      _filterWords();
    });
    _showWordsDialog(context, filteredWords);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FavoritesPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DictionaryScreen()),
        );
        break;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final translations = getTranslations(localeProvider.language);
    final lessonTranslations = getLessonTranslations(localeProvider.language);
    final lessons = lessonTranslations.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations['lessons'] ?? 'Lessons',
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
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.yellow[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText:
                        translations['searchLessons'] ?? 'Search lessons...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                  ),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child:
                    _isLoading
                        ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(color: Colors.green),
                              SizedBox(height: 16),
                              Text(
                                'Loading lessons...',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        )
                        : _errorMessage != null
                        ? Center(
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        )
                        : ListView.builder(
                          itemCount: lessons.length,
                          itemBuilder: (context, index) {
                            final lessonKey = lessons[index];
                            final lesson = lessonTranslations[lessonKey];
                            return _buildLessonCard(
                              lessonKey,
                              lesson,
                              translations,
                              localeProvider.language,
                            );
                          },
                        ),
              ),
            ],
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFFFFC107), // Yellow
          unselectedItemColor: const Color(0xFF009A44), // Green
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.book),
              label: translations['lessons'] ?? 'Lessons',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: translations['favorites'] ?? 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.bookmark),
              label: translations['dictionary'] ?? 'Dictionary',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonCard(
    String lessonKey,
    Map<String, String>? lesson,
    Map<String, dynamic> translations,
    SupportedLanguage selectedLanguage,
  ) {
    if (lesson == null) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () => _onLessonTapped(lessonKey),
      child: Card(
        elevation: 3,
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
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            title: Text(
              lesson['title'] ?? lessonKey,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              lesson['description'] ?? '',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
        ),
      ),
    );
  }

  void _showWordsDialog(BuildContext context, List<dynamic> words) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    final translations = getTranslations(localeProvider.language);
    final selectedLanguage = localeProvider.language;

    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              height:
                  MediaQuery.of(context).size.height *
                  0.6, // Set modal height to 60% of screen height
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.green[100]!, Colors.yellow[100]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translations['dictionary'] ?? 'Dictionary',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(color: Colors.green, height: 16),
                  Expanded(
                    child:
                        words.isEmpty
                            ? Center(
                              child: Text(
                                translations['noWordsFound'] ??
                                    'No words found',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            )
                            : ListView.builder(
                              itemCount: words.length,
                              itemBuilder: (context, index) {
                                final entry = words[index];
                                return _buildWordCard(
                                  entry,
                                  translations,
                                  selectedLanguage,
                                );
                              },
                            ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        translations['okButton'] ?? 'Close',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildWordCard(
    dynamic entry,
    Map<String, dynamic> translations,
    SupportedLanguage selectedLanguage,
  ) {
    String primaryWord;
    switch (selectedLanguage) {
      case SupportedLanguage.amharic:
        primaryWord = entry['amharic'];
        break;
      case SupportedLanguage.oromiffa:
        primaryWord = entry['oromifa'];
        break;
      case SupportedLanguage.tigrigna:
        primaryWord = entry['tigrinya'];
        break;
      case SupportedLanguage.english:
      default:
        primaryWord = entry['english'];
        break;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              primaryWord,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            if (selectedLanguage != SupportedLanguage.english)
              Text(
                'English: ${entry['english']}',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            if (selectedLanguage != SupportedLanguage.amharic)
              Text(
                'Amharic: ${entry['amharic']}',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            if (selectedLanguage != SupportedLanguage.oromiffa)
              Text(
                'Oromifa: ${entry['oromifa']}',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            if (selectedLanguage != SupportedLanguage.tigrigna)
              Text(
                'Tigrinya: ${entry['tigrinya']}',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            Text(
              'Pronunciation: ${entry['pronunciation']}',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            Text(
              '${translations['categoryLabel'] ?? 'Category'}: ${entry['category']}',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
