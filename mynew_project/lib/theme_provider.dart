import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  double _fontSize = 16.0;
  bool _isOfflineAccessEnabled = true;

  ThemeMode get themeMode => _themeMode;
  double get fontSize => _fontSize;
  bool get isOfflineAccessEnabled => _isOfflineAccessEnabled;

  ThemeProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode =
        (prefs.getBool('darkMode') ?? false) ? ThemeMode.dark : ThemeMode.light;
    _fontSize = prefs.getDouble('fontSize') ?? 16.0;
    _isOfflineAccessEnabled = prefs.getBool('offlineAccess') ?? true;
    notifyListeners();
  }

  Future<void> setThemeMode(bool isDarkMode) async {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDarkMode);
    notifyListeners();
  }

  Future<void> setFontSize(double fontSize) async {
    _fontSize = fontSize;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fontSize);
    notifyListeners();
  }

  Future<void> setOfflineAccess(bool enabled) async {
    _isOfflineAccessEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('offlineAccess', enabled);
    notifyListeners();
  }
}
