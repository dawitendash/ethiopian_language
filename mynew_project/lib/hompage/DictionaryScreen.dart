import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  List<Map<String, String>> _words = [];
  List<Map<String, String>> _filteredWords = [];
  String _searchText = '';
  String _selectedLanguage = 'english';
  String? _selectedCategory;
  List<String> _categories = ['All'];
  final AudioPlayer _audioPlayer = AudioPlayer();
  Set<String> _favorites = {};
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    _loadWords();
  }

  // Load favorites from SharedPreferences
  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _favorites = prefs.getStringList('favorites')?.toSet() ?? {};
      });
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }

  // Save favorites to SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('favorites', _favorites.toList());
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  // Load words from JSON file and extract categories
  Future<void> _loadWords() async {
    try {
      final data = await DefaultAssetBundle.of(
        context,
      ).loadString('assets/ethiopian_dictionary.json');
      final jsonResult = json.decode(data) as List<dynamic>;
      setState(() {
        _words =
            jsonResult.cast<Map<String, dynamic>>().map((word) {
              return word.map(
                (key, value) => MapEntry(key, value?.toString() ?? ''),
              );
            }).toList();
        // Extract unique categories
        _categories =
            ['All'] +
                  _words
                      .map((word) => word['category'] ?? 'Unknown')
                      .toSet()
                      .toList()
              ..sort();
        // Sort words alphabetically by English 'word' initially
        _words.sort(
          (a, b) =>
              a['word']!.toLowerCase().compareTo(b['word']!.toLowerCase()),
        );
        _filteredWords = _words;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading JSON: $e');
      setState(() {
        _errorMessage = 'Failed to load dictionary: $e';
        _isLoading = false;
      });
    }
  }

  // Filter and sort words based on search text, selected language, and category
  void _filterWords(String searchText) {
    setState(() {
      _searchText = searchText;
      _filteredWords =
          _words.where((word) {
            // Apply category filter
            final matchesCategory =
                _selectedCategory == null ||
                _selectedCategory == 'All' ||
                word['category'] == _selectedCategory;
            // Apply search filter
            final searchField = word[_selectedLanguage]?.toLowerCase() ?? '';
            final matchesSearch =
                searchText.isEmpty ||
                searchField.contains(searchText.toLowerCase());
            return matchesCategory && matchesSearch;
          }).toList();
      // Sort filtered words alphabetically by the selected language
      _filteredWords.sort((a, b) {
        final aText = a[_selectedLanguage]?.toLowerCase() ?? '';
        final bText = b[_selectedLanguage]?.toLowerCase() ?? '';
        return aText.compareTo(bText);
      });
    });
  }

  // Play pronunciation audio
  Future<void> _playAudio(String? pronunciation) async {
    if (pronunciation == null || pronunciation.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No pronunciation audio available')),
      );
      return;
    }
    try {
      await _audioPlayer.play(AssetSource('audio/$pronunciation.mp3'));
    } catch (e) {
      debugPrint('Error playing audio for $pronunciation: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error playing audio: $e')));
    }
  }

  // Toggle favorite status
  void _toggleFavorite(String? word) {
    if (word == null) return;
    setState(() {
      if (_favorites.contains(word)) {
        _favorites.remove(word);
      } else {
        _favorites.add(word);
      }
      _saveFavorites();
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ethiopian Dictionary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[800], // Ethiopian green
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
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              setState(() {
                _filteredWords =
                    _words
                        .where((word) => _favorites.contains(word['word']))
                        .toList();
                // Sort favorites alphabetically by selected language
                _filteredWords.sort((a, b) {
                  final aText = a[_selectedLanguage]?.toLowerCase() ?? '';
                  final bText = b[_selectedLanguage]?.toLowerCase() ?? '';
                  return aText.compareTo(bText);
                });
                _searchText = '';
                _selectedCategory = null; // Reset category filter
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Showing favorite words')),
              );
            },
            tooltip: 'View Favorites',
          ),
        ],
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Language selector
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
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Text(
                      'Search in:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: _selectedLanguage,
                      items: const [
                        DropdownMenuItem(
                          value: 'english',
                          child: Text(
                            'English',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'amharic',
                          child: Text(
                            'Amharic',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'oromifa',
                          child: Text(
                            'Oromifa',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'tigrinya',
                          child: Text(
                            'Tigrinya',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedLanguage = value!;
                          _filterWords(_searchText);
                        });
                      },
                      style: const TextStyle(color: Colors.black87),
                      dropdownColor: Colors.white,
                      underline: const SizedBox(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Category selector
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
                      blurRadius: 8,
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
                    DropdownButton<String>(
                      value: _selectedCategory ?? 'All',
                      items:
                          _categories
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value == 'All' ? null : value;
                          _filterWords(_searchText);
                        });
                      },
                      style: const TextStyle(color: Colors.black87),
                      dropdownColor: Colors.white,
                      underline: const SizedBox(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: _filterWords,
                  decoration: InputDecoration(
                    hintText: 'Search words...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              // Word list or loading/error state
              Expanded(
                child:
                    _isLoading
                        ? const Center(
                          child: CircularProgressIndicator(color: Colors.green),
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
                        : _filteredWords.isEmpty
                        ? const Center(
                          child: Text(
                            'No words found',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        )
                        : ListView.builder(
                          itemCount: _filteredWords.length,
                          itemBuilder: (context, index) {
                            final word = _filteredWords[index];
                            return _buildWordCard(word);
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build a word card
  Widget _buildWordCard(Map<String, String> word) {
    final wordText = word['word'] ?? 'Unknown';
    final subtitleText = word[_selectedLanguage] ?? 'N/A';

    return GestureDetector(
      onTap: () => _showWordDetails(context, word),
      child: Card(
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
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            title: Text(
              wordText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              subtitleText,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    _favorites.contains(word['word'])
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () => _toggleFavorite(word['word']),
                  tooltip: 'Toggle Favorite',
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up, color: Colors.green),
                  onPressed: () => _playAudio(word['pronunciation']),
                  tooltip: 'Play Pronunciation',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Show detailed word dialog
  void _showWordDetails(BuildContext context, Map<String, String> word) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.green[50]!, Colors.yellow[50]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    word['word'] ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(color: Colors.green, height: 20),
                  _buildDetailRow('Category', word['category']),
                  _buildDetailRow('English', word['english']),
                  _buildDetailRow('Amharic', word['amharic']),
                  _buildDetailRow('Oromifa', word['oromifa']),
                  _buildDetailRow('Tigrinya', word['tigrinya']),
                  _buildDetailRow('Pronunciation', word['pronunciation']),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
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

  // Build a detail row for the dialog
  Widget _buildDetailRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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
