// import 'package:flutter/material.dart';
// import 'package:mynew_project/hompage/firstpage.dart';
// import 'package:mynew_project/hompage/locale_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:mynew_project/models/translation_dictionary.dart';
// import '../models/supported_language.dart';
// import '../theme_provider.dart';
// import '../models/translation_dictionary.dart';

// class TranslatePage extends StatefulWidget {
//   const TranslatePage({Key? key}) : super(key: key);

//   @override
//   _TranslatePageState createState() => _TranslatePageState();
// }

// class _TranslatePageState extends State<TranslatePage> {
//   final TextEditingController _inputController = TextEditingController();
//   String _translatedText = '';
//   SupportedLanguage _sourceLanguage = SupportedLanguage.english;
//   SupportedLanguage _targetLanguage = SupportedLanguage.amharic;

//   void _navigateToDashboard() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const Dashbord()),
//     );
//   }

//   Future<String> _translate(
//     String text,
//     SupportedLanguage source,
//     SupportedLanguage target,
//   ) async {
//     await Future.delayed(const Duration(milliseconds: 500));
//     if (text.isEmpty) {
//       return '';
//     }

//     final dictionary = getTranslationDictionary();
//     print('Dictionary type: ${dictionary.runtimeType}');
//     final key =
//         '${source.toString().split('.').last}_${target.toString().split('.').last}';
//     print('Key: $key');

//     final translations = dictionary[key];
//     print('Translations: $translations');
//     return translations?[text.toLowerCase()] ?? 'Translation not available';
//   }

//   void _performTranslation() async {
//     final translations = getTranslations(
//       Provider.of<LocaleProvider>(context, listen: false).language,
//     );
//     if (_inputController.text.isEmpty) {
//       setState(() {
//         _translatedText = '';
//       });
//       return;
//     }
//     String translation = await _translate(
//       _inputController.text,
//       _sourceLanguage,
//       _targetLanguage,
//     );
//     setState(() {
//       _translatedText =
//           translation == 'Translation not available'
//               ? translations['translationNotAvailable'] ?? translation
//               : translation;
//     });
//   }

//   void _swapLanguages() {
//     setState(() {
//       final temp = _sourceLanguage;
//       _sourceLanguage = _targetLanguage;
//       _targetLanguage = temp;
//       _translatedText = '';
//       _inputController.clear();
//     });
//   }

//   @override
//   void dispose() {
//     _inputController.dispose();
//     super.dispose();
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
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   color: isDarkMode ? Colors.grey[800] : Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     DropdownButton<SupportedLanguage>(
//                       value: _sourceLanguage,
//                       hint: Text(
//                         translations['sourceLanguage'] ?? 'Source Language',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: isDarkMode ? Colors.white : Colors.black87,
//                         ),
//                       ),
//                       items:
//                           SupportedLanguage.values.map((
//                             SupportedLanguage language,
//                           ) {
//                             return DropdownMenuItem<SupportedLanguage>(
//                               value: language,
//                               child: Text(
//                                 getLanguageDisplayName(language),
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color:
//                                       isDarkMode
//                                           ? Colors.white
//                                           : Colors.black87,
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                       onChanged: (SupportedLanguage? newValue) {
//                         setState(() {
//                           _sourceLanguage = newValue!;
//                           _translatedText = '';
//                         });
//                       },
//                       style: TextStyle(
//                         color: isDarkMode ? Colors.white : Colors.black87,
//                         fontSize: 16,
//                       ),
//                       dropdownColor:
//                           isDarkMode ? Colors.grey[800] : Colors.white,
//                       underline: const SizedBox(),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.swap_horiz, color: Colors.green),
//                       onPressed: _swapLanguages,
//                     ),
//                     DropdownButton<SupportedLanguage>(
//                       value: _targetLanguage,
//                       hint: Text(
//                         translations['targetLanguage'] ?? 'Target Language',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: isDarkMode ? Colors.white : Colors.black87,
//                         ),
//                       ),
//                       items:
//                           SupportedLanguage.values.map((
//                             SupportedLanguage language,
//                           ) {
//                             return DropdownMenuItem<SupportedLanguage>(
//                               value: language,
//                               child: Text(
//                                 getLanguageDisplayName(language),
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color:
//                                       isDarkMode
//                                           ? Colors.white
//                                           : Colors.black87,
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                       onChanged: (SupportedLanguage? newValue) {
//                         setState(() {
//                           _targetLanguage = newValue!;
//                           _translatedText = '';
//                         });
//                       },
//                       style: TextStyle(
//                         color: isDarkMode ? Colors.white : Colors.black87,
//                         fontSize: 16,
//                       ),
//                       dropdownColor:
//                           isDarkMode ? Colors.grey[800] : Colors.white,
//                       underline: const SizedBox(),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 decoration: BoxDecoration(
//                   color: isDarkMode ? Colors.grey[800] : Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   controller: _inputController,
//                   decoration: InputDecoration(
//                     hintText:
//                         translations['enterText'] ?? 'Enter text to translate',
//                     prefixIcon: const Icon(
//                       Icons.text_fields,
//                       color: Colors.grey,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
//                     contentPadding: const EdgeInsets.symmetric(
//                       vertical: 14,
//                       horizontal: 16,
//                     ),
//                   ),
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: isDarkMode ? Colors.white : Colors.black87,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _performTranslation,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green[800],
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   translations['translateButton'] ?? 'Translate',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Container(
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     gradient: LinearGradient(
//                       colors: [
//                         isDarkMode ? Colors.grey[800]! : Colors.white,
//                         isDarkMode ? Colors.grey[800]! : Colors.yellow[50]!,
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                   child: Text(
//                     _translatedText.isEmpty
//                         ? translations['noTranslation'] ?? 'No translation yet'
//                         : _translatedText,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: isDarkMode ? Colors.white : Colors.black87,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
