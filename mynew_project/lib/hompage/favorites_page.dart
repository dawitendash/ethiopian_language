import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/learn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> _favoriteGreetings = [];
  List<String> _filteredGreetings = []; // Added for filtered results
  Map<String, bool> _expandedState = {};
  bool _isLoading = true;
  final TextEditingController _searchController =
      TextEditingController(); // Added for search input

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    // Add listener for search input changes
    _searchController.addListener(_filterGreetings);
  }

  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList('favorites') ?? [];
      setState(() {
        _favoriteGreetings = favorites;
        _filteredGreetings = favorites; // Initialize filtered list
        _expandedState = {for (var greeting in favorites) greeting: false};
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      debugPrint('Error loading favorites: $e');
    }
  }

  // Added search filter function
  void _filterGreetings() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredGreetings =
          _favoriteGreetings
              .where((greeting) => greeting.toLowerCase().contains(query))
              .toList();
    });
  }

  void _navigateBack() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LessonsScreen(fullName: '')),
    );
  }

  @override
  void dispose() {
    _searchController.dispose(); // Clean up controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite',
          style: TextStyle(
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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _navigateBack,
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
          child: Column(
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search favorite greetings...',
                    prefixIcon: Icon(Icons.search, color: Colors.green[800]),
                    border: InputBorder.none,
                    suffixIcon:
                        _searchController.text.isNotEmpty
                            ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                              },
                            )
                            : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Header with count
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
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
                    Icon(Icons.star, color: Colors.yellow[700], size: 28),
                    const SizedBox(width: 10),
                    Text(
                      '${_filteredGreetings.length} Favorite Greetings', // Updated to use filtered count
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Greetings list
              Expanded(
                child:
                    _isLoading
                        ? const Center(
                          child: CircularProgressIndicator(color: Colors.green),
                        )
                        : _filteredGreetings
                            .isEmpty // Updated to check filtered list
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border,
                                size: 60,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                _searchController.text.isEmpty
                                    ? 'No favorite greetings yet'
                                    : 'No matching greetings found',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _searchController.text.isEmpty
                                    ? 'Add greetings to your favorites\nfrom the greetings page'
                                    : 'Try a different search term',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount:
                              _filteredGreetings
                                  .length, // Updated to use filtered list
                          itemBuilder: (context, index) {
                            final greeting = _filteredGreetings[index];
                            return _buildGreetingCard(greeting);
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingCard(String greeting) {
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
        child: ExpansionTile(
          leading: Icon(Icons.star, color: Colors.yellow[700], size: 28),
          title: Text(
            greeting,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          trailing: Icon(
            _expandedState[greeting] == true
                ? Icons.expand_less
                : Icons.expand_more,
            color: Colors.green[800],
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _expandedState[greeting] = expanded;
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detailed Information',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This greeting can be used in various contexts. '
                    'Add more specific details about usage, pronunciation, '
                    'or cultural significance here.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add action for sharing or more options
                        },
                        child: Text(
                          'MORE OPTIONS',
                          style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
