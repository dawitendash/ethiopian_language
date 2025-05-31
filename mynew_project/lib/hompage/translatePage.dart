import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mynew_project/hompage/firstpage.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:mynew_project/models/supported_language.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});
  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final TextEditingController _inputController = TextEditingController();
  String _translatedText = '';
  String _sourceLang = 'en';
  String _targetLang = 'am';
  bool _isLoading = false;

  List<dynamic> dictionary = [];

  final Map<String, String> languages = {
    'English': 'en',
    'Amharic': 'am',
    'Oromo': 'om',
    'Tigrinya': 'ti',
  };

  @override
  void initState() {
    super.initState();
    loadDictionary();
  }

  Future<void> loadDictionary() async {
    final jsonString = await rootBundle.loadString(
      'assets/ethiopian_dictionary.json',
    );
    final data = jsonDecode(jsonString);
    setState(() {
      dictionary = data;
    });
  }

  String lookupTranslation(String input, String sourceLang, String targetLang) {
    final inputLower = input.toLowerCase();

    for (final item in dictionary) {
      final english = (item['english'] ?? '').toString().toLowerCase();
      final amharic = (item['amharic'] ?? '').toString().toLowerCase();
      final oromifa = (item['oromifa'] ?? '').toString().toLowerCase();
      final tigrinya = (item['tigrinya'] ?? '').toString().toLowerCase();

      bool inputMatches = switch (sourceLang) {
        'en' => inputLower == english,
        'am' => inputLower == amharic,
        'om' => inputLower == oromifa,
        'ti' => inputLower == tigrinya,
        _ => false,
      };

      if (inputMatches) {
        return switch (targetLang) {
          'en' => item['english'] ?? '',
          'am' => item['amharic'] ?? '',
          'om' => item['oromifa'] ?? '',
          'ti' => item['tigrinya'] ?? '',
          _ => '',
        };
      }
    }

    return 'Translation not found.';
  }

  Future<void> _translate() async {
    final input = _inputController.text.trim();
    if (input.isEmpty) return;

    setState(() {
      _isLoading = true;
      _translatedText = '';
    });

    await Future.delayed(const Duration(milliseconds: 300));

    final result = lookupTranslation(input, _sourceLang, _targetLang);

    setState(() {
      _translatedText = result;
      _isLoading = false;
    });
  }

  void _navigateToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Dashbord()),
    );
  }

  Widget _buildDropdown(
    String label,
    String currentValue,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: currentValue,
          items:
              languages.entries
                  .map(
                    (e) => DropdownMenuItem(value: e.value, child: Text(e.key)),
                  )
                  .toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final translations = getTranslations(localeProvider.language);
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo.shade700,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _navigateToDashboard,
        ),
      ),
      backgroundColor: isDark ? Colors.grey.shade900 : const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Text',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _inputController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. Thank you',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    'From',
                    _sourceLang,
                    (val) => setState(() => _sourceLang = val!),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDropdown(
                    'To',
                    _targetLang,
                    (val) => setState(() => _targetLang = val!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _translate,
                icon:
                    _isLoading
                        ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        : const Icon(Icons.translate),
                label: const Text('Translate'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.indigo.shade600,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Translated Text',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade800 : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  if (!isDark)
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: SelectableText(
                _translatedText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '* Note: All translations are done locally using offline dictionary.',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:mynew_project/hompage/firstpage.dart'; // Ensure Dashboard is defined
// import 'package:mynew_project/hompage/locale_provider.dart';
// import 'package:provider/provider.dart';

// import '../models/supported_language.dart';
// import '../theme_provider.dart';

// class TranslatePage extends StatefulWidget {
//   const TranslatePage({super.key});

//   @override
//   _TranslatePageState createState() => _TranslatePageState();
// }

// class _TranslatePageState extends State<TranslatePage> {
//   void _navigateToDashboard() {
//     try {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const Dashbord()),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Navigation error: $e')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final localeProvider = Provider.of<LocaleProvider>(context);
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final translations = getTranslations(localeProvider.language);
//     final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           translations['appBarTitleTranslate'] ?? 'Translate',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.green[800],
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.green[800]!, Colors.yellow[600]!],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         leading: IconButton(
//           onPressed: _navigateToDashboard,
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient:
//               isDarkMode
//                   ? null
//                   : LinearGradient(
//                     colors: [Colors.green[50]!, Colors.yellow[50]!],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//         ),
//         child: Center(
//           child: Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             margin: const EdgeInsets.symmetric(horizontal: 16),
//             child: Container(
//               padding: const EdgeInsets.all(24.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 gradient: LinearGradient(
//                   colors: [
//                     isDarkMode ? Colors.grey[800]! : Colors.white,
//                     isDarkMode ? Colors.grey[800]! : Colors.yellow[50]!,
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.construction, size: 60, color: Colors.green[800]),
//                   const SizedBox(height: 16),
//                   Text(
//                     translations['comingSoon'] ?? 'Coming Soon!',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: isDarkMode ? Colors.white : Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     translations['comingSoonMessage'] ??
//                         'This feature is under development. Stay tuned!',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: isDarkMode ? Colors.white70 : Colors.black54,
//                       height: 1.5,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:mynew_project/hompage/firstpage.dart';
// // import 'package:mynew_project/hompage/locale_provider.dart';
// // import 'package:provider/provider.dart';
// // import 'package:mynew_project/models/translation_dictionary.dart';
// // import '../models/supported_language.dart';
// // import '../theme_provider.dart';
// // import '../models/translation_dictionary.dart';

// // class TranslatePage extends StatefulWidget {
// //   const TranslatePage({Key? key}) : super(key: key);

// //   @override
// //   _TranslatePageState createState() => _TranslatePageState();
// // }

// // class _TranslatePageState extends State<TranslatePage> {
// //   final TextEditingController _inputController = TextEditingController();
// //   String _translatedText = '';
// //   SupportedLanguage _sourceLanguage = SupportedLanguage.english;
// //   SupportedLanguage _targetLanguage = SupportedLanguage.amharic;

// //   void _navigateToDashboard() {
// //     Navigator.pushReplacement(
// //       context,
// //       MaterialPageRoute(builder: (context) => const Dashbord()),
// //     );
// //   }

// //   Future<String> _translate(
// //     String text,
// //     SupportedLanguage source,
// //     SupportedLanguage target,
// //   ) async {
// //     await Future.delayed(const Duration(milliseconds: 500));
// //     if (text.isEmpty) {
// //       return '';
// //     }

// //     final dictionary = getTranslationDictionary();
// //     print('Dictionary type: ${dictionary.runtimeType}');
// //     final key =
// //         '${source.toString().split('.').last}_${target.toString().split('.').last}';
// //     print('Key: $key');

// //     final translations = dictionary[key];
// //     print('Translations: $translations');
// //     return translations?[text.toLowerCase()] ?? 'Translation not available';
// //   }

// //   void _performTranslation() async {
// //     final translations = getTranslations(
// //       Provider.of<LocaleProvider>(context, listen: false).language,
// //     );
// //     if (_inputController.text.isEmpty) {
// //       setState(() {
// //         _translatedText = '';
// //       });
// //       return;
// //     }
// //     String translation = await _translate(
// //       _inputController.text,
// //       _sourceLanguage,
// //       _targetLanguage,
// //     );
// //     setState(() {
// //       _translatedText =
// //           translation == 'Translation not available'
// //               ? translations['translationNotAvailable'] ?? translation
// //               : translation;
// //     });
// //   }

// //   void _swapLanguages() {
// //     setState(() {
// //       final temp = _sourceLanguage;
// //       _sourceLanguage = _targetLanguage;
// //       _targetLanguage = temp;
// //       _translatedText = '';
// //       _inputController.clear();
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _inputController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final localeProvider = Provider.of<LocaleProvider>(context);
// //     final themeProvider = Provider.of<ThemeProvider>(context);
// //     final translations = getTranslations(localeProvider.language);
// //     final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           translations['appBarTitleTranslate'] ?? 'Translate',
// //           style: const TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 22,
// //             color: Colors.white,
// //           ),
// //         ),
// //         backgroundColor: Colors.green[800],
// //         elevation: 0,
// //         flexibleSpace: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Colors.green[800]!, Colors.yellow[600]!],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //             ),
// //           ),
// //         ),
// //         leading: IconButton(
// //           onPressed: _navigateToDashboard,
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //         ),
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient:
// //               isDarkMode
// //                   ? null
// //                   : LinearGradient(
// //                     colors: [Colors.green[50]!, Colors.yellow[50]!],
// //                     begin: Alignment.topCenter,
// //                     end: Alignment.bottomCenter,
// //                   ),
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 12,
// //                   vertical: 8,
// //                 ),
// //                 decoration: BoxDecoration(
// //                   color: isDarkMode ? Colors.grey[800] : Colors.white,
// //                   borderRadius: BorderRadius.circular(12),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.black.withOpacity(0.1),
// //                       blurRadius: 8,
// //                       offset: const Offset(0, 2),
// //                     ),
// //                   ],
// //                 ),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   children: [
// //                     DropdownButton<SupportedLanguage>(
// //                       value: _sourceLanguage,
// //                       hint: Text(
// //                         translations['sourceLanguage'] ?? 'Source Language',
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           color: isDarkMode ? Colors.white : Colors.black87,
// //                         ),
// //                       ),
// //                       items:
// //                           SupportedLanguage.values.map((
// //                             SupportedLanguage language,
// //                           ) {
// //                             return DropdownMenuItem<SupportedLanguage>(
// //                               value: language,
// //                               child: Text(
// //                                 getLanguageDisplayName(language),
// //                                 style: TextStyle(
// //                                   fontSize: 16,
// //                                   color:
// //                                       isDarkMode
// //                                           ? Colors.white
// //                                           : Colors.black87,
// //                                 ),
// //                               ),
// //                             );
// //                           }).toList(),
// //                       onChanged: (SupportedLanguage? newValue) {
// //                         setState(() {
// //                           _sourceLanguage = newValue!;
// //                           _translatedText = '';
// //                         });
// //                       },
// //                       style: TextStyle(
// //                         color: isDarkMode ? Colors.white : Colors.black87,
// //                         fontSize: 16,
// //                       ),
// //                       dropdownColor:
// //                           isDarkMode ? Colors.grey[800] : Colors.white,
// //                       underline: const SizedBox(),
// //                     ),
// //                     IconButton(
// //                       icon: Icon(Icons.swap_horiz, color: Colors.green),
// //                       onPressed: _swapLanguages,
// //                     ),
// //                     DropdownButton<SupportedLanguage>(
// //                       value: _targetLanguage,
// //                       hint: Text(
// //                         translations['targetLanguage'] ?? 'Target Language',
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           color: isDarkMode ? Colors.white : Colors.black87,
// //                         ),
// //                       ),
// //                       items:
// //                           SupportedLanguage.values.map((
// //                             SupportedLanguage language,
// //                           ) {
// //                             return DropdownMenuItem<SupportedLanguage>(
// //                               value: language,
// //                               child: Text(
// //                                 getLanguageDisplayName(language),
// //                                 style: TextStyle(
// //                                   fontSize: 16,
// //                                   color:
// //                                       isDarkMode
// //                                           ? Colors.white
// //                                           : Colors.black87,
// //                                 ),
// //                               ),
// //                             );
// //                           }).toList(),
// //                       onChanged: (SupportedLanguage? newValue) {
// //                         setState(() {
// //                           _targetLanguage = newValue!;
// //                           _translatedText = '';
// //                         });
// //                       },
// //                       style: TextStyle(
// //                         color: isDarkMode ? Colors.white : Colors.black87,
// //                         fontSize: 16,
// //                       ),
// //                       dropdownColor:
// //                           isDarkMode ? Colors.grey[800] : Colors.white,
// //                       underline: const SizedBox(),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 16),
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: isDarkMode ? Colors.grey[800] : Colors.white,
// //                   borderRadius: BorderRadius.circular(12),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.black.withOpacity(0.1),
// //                       blurRadius: 8,
// //                       offset: const Offset(0, 2),
// //                     ),
// //                   ],
// //                 ),
// //                 child: TextField(
// //                   controller: _inputController,
// //                   decoration: InputDecoration(
// //                     hintText:
// //                         translations['enterText'] ?? 'Enter text to translate',
// //                     prefixIcon: const Icon(
// //                       Icons.text_fields,
// //                       color: Colors.grey,
// //                     ),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                       borderSide: BorderSide.none,
// //                     ),
// //                     filled: true,
// //                     fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
// //                     contentPadding: const EdgeInsets.symmetric(
// //                       vertical: 14,
// //                       horizontal: 16,
// //                     ),
// //                   ),
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     color: isDarkMode ? Colors.white : Colors.black87,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 16),
// //               ElevatedButton(
// //                 onPressed: _performTranslation,
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.green[800],
// //                   foregroundColor: Colors.white,
// //                   padding: const EdgeInsets.symmetric(vertical: 15),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                 ),
// //                 child: Text(
// //                   translations['translateButton'] ?? 'Translate',
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 16),
// //               Card(
// //                 elevation: 4,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Container(
// //                   padding: const EdgeInsets.all(16.0),
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(12),
// //                     gradient: LinearGradient(
// //                       colors: [
// //                         isDarkMode ? Colors.grey[800]! : Colors.white,
// //                         isDarkMode ? Colors.grey[800]! : Colors.yellow[50]!,
// //                       ],
// //                       begin: Alignment.topLeft,
// //                       end: Alignment.bottomRight,
// //                     ),
// //                   ),
// //                   child: Text(
// //                     _translatedText.isEmpty
// //                         ? translations['noTranslation'] ?? 'No translation yet'
// //                         : _translatedText,
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       color: isDarkMode ? Colors.white : Colors.black87,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
