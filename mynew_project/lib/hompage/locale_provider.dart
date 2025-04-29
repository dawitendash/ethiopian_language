import 'package:flutter/material.dart';
import 'package:mynew_project/models/supported_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en');
  SupportedLanguage _language = SupportedLanguage.english;

  Locale get locale => _locale;
  SupportedLanguage get language => _language;

  LocaleProvider() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language') ?? 'en';
    _setLocale(languageCode);
    notifyListeners();
  }

  void setLocale(SupportedLanguage language) async {
    final languageCode = _languageToCode(language);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    _setLocale(languageCode);
    _language = language;
    notifyListeners();
  }

  void _setLocale(String languageCode) {
    switch (languageCode) {
      case 'am':
        _locale = const Locale('am');
        _language = SupportedLanguage.amharic;
        break;
      case 'om':
        _locale = const Locale('om');
        _language = SupportedLanguage.oromiffa;
        break;
      case 'ti':
        _locale = const Locale('ti');
        _language = SupportedLanguage.tigrigna;
        break;
      case 'en':
      default:
        _locale = const Locale('en');
        _language = SupportedLanguage.english;
        break;
    }
  }

  String _languageToCode(SupportedLanguage language) {
    switch (language) {
      case SupportedLanguage.amharic:
        return 'am';
      case SupportedLanguage.oromiffa:
        return 'om';
      case SupportedLanguage.tigrigna:
        return 'ti';
      case SupportedLanguage.english:
      default:
        return 'en';
    }
  }
}
