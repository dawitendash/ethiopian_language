import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mynew_project/hompage/DictionaryScreen.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:provider/provider.dart';

import '../models/supported_language.dart';
import 'favorites_page.dart';

class LessonsScreen extends StatefulWidget {
  final String fullName;

  const LessonsScreen({Key? key, required this.fullName}) : super(key: key);

  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  List<dynamic> lessons = [];
  List<dynamic> filteredLessons = [];
  String selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    loadLessons();
    _searchController.addListener(_filterLessons);
  }

  Future<void> loadLessons() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/lessons.json',
      );
      final data = json.decode(response);
      setState(() {
        lessons = data;
        filteredLessons = lessons;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load lessons: $e';
        _isLoading = false;
      });
    }
  }

  void _filterLessons() {
    final query = _searchController.text.toLowerCase();
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    final lessonTrans = getLessonTranslations(localeProvider.language);
    setState(() {
      filteredLessons =
          lessons.where((lesson) {
            final trans = lessonTrans[lesson['title']] ?? {};
            final title = (trans['title'] ?? lesson['title']).toLowerCase();
            final desc =
                (trans['description'] ?? lesson['description']).toLowerCase();
            final matchesQuery = title.contains(query) || desc.contains(query);
            final matchesCategory =
                selectedCategory == 'All' ||
                lesson['category'] == selectedCategory;
            return matchesQuery && matchesCategory;
          }).toList();
    });
  }

  void _onCategoryChanged(String? newValue) {
    setState() {
      selectedCategory = newValue ?? 'All';
      _filterLessons();
    }

    ;
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
    final lessonTrans = getLessonTranslations(localeProvider.language);
    final categories = [
      'All',
      ...lessons.map((lesson) => lesson['category']).toSet().toList(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations['appBarTitleLessons'] ?? 'Lessons',
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
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
                child: Row(
                  children: [
                    const Text(
                      'Category:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        items:
                            categories.map((category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(
                                  category,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                              );
                            }).toList(),
                        onChanged: _onCategoryChanged,
                        style: const TextStyle(color: Colors.black87),
                        dropdownColor: Colors.white,
                        underline: const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
                        : filteredLessons.isEmpty
                        ? const Center(
                          child: Text(
                            'No lessons found',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        )
                        : ListView.builder(
                          itemCount: filteredLessons.length,
                          itemBuilder: (context, index) {
                            final lesson = filteredLessons[index];
                            return _buildLessonCard(
                              lesson,
                              lessonTrans,
                              translations,
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
    dynamic lesson,
    Map<String, dynamic> lessonTrans,
    Map<String, dynamic> translations,
  ) {
    final trans = lessonTrans[lesson['title']] ?? {};
    final title = trans['title'] ?? lesson['title'];
    final desc = trans['description'] ?? lesson['description'];

    return GestureDetector(
      onTap:
          () => _showLessonDetails(context, lesson, lessonTrans, translations),
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
            leading: Image.asset(
              lesson['image'],
              width: 50,
              height: 50,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.error, color: Colors.red, size: 50),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  desc,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${translations['categoryLabel'] ?? 'Category'}: ${lesson['category']}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Text(
                  '${translations['levelLabel'] ?? 'Level'}: ${lesson['level']}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLessonDetails(
    BuildContext context,
    dynamic lesson,
    Map<String, dynamic> lessonTrans,
    Map<String, dynamic> translations,
  ) {
    final trans = lessonTrans[lesson['title']] ?? {};
    final title = trans['title'] ?? lesson['title'];
    final desc = trans['description'] ?? lesson['description'];

    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.green[100]!, Colors.yellow[100]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Divider(color: Colors.green, height: 16),
                    _buildDetailRow('Description', desc),
                    _buildDetailRow('Category', lesson['category']),
                    _buildDetailRow('Level', lesson['level']),
                    const SizedBox(height: 16),
                    Image.asset(
                      lesson['image'],
                      width: 100,
                      height: 100,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Close',
                          style: TextStyle(
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
          ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
