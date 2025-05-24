import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/firstpage.dart'; // Ensure Dashboard is defined
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:provider/provider.dart';

import '../models/supported_language.dart';
import '../theme_provider.dart';

class LanguageExchangePage extends StatefulWidget {
  const LanguageExchangePage({super.key});

  @override
  _LanguageExchangePageState createState() => _LanguageExchangePageState();
}

class _LanguageExchangePageState extends State<LanguageExchangePage> {
  void _navigateToDashboard() {
    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashbord()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Navigation error: $e')));
    }
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
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
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
                    colors: [Colors.purple[50]!, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
        ),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    isDarkMode ? Colors.grey[800]! : Colors.white,
                    isDarkMode ? Colors.grey[800]! : Colors.purple[50]!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.construction, size: 60, color: Colors.deepPurple),
                  const SizedBox(height: 16),
                  Text(
                    translations['comingSoon'] ?? 'Coming Soon!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    translations['comingSoonMessage'] ??
                        'This feature is under development. Stay tuned!',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mynew_project/hompage/firstpage.dart';
// import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';

// import '../hompage/locale_provider.dart';
// import '../models/supported_language.dart';
// import '../theme_provider.dart';
// //import 'video_call.dart';

// class LanguageExchangePage extends StatefulWidget {
//   const LanguageExchangePage({Key? key}) : super(key: key);

//   @override
//   _LanguageExchangePageState createState() => _LanguageExchangePageState();
// }

// class _LanguageExchangePageState extends State<LanguageExchangePage> {
//   final List<Map<String, String>> users = [
//     {
//       'name': 'Abebe Kebede',
//       'languageLearning': 'English',
//       'languageSpeaking': 'Amharic',
//       'bio':
//           'Learning English to connect with the world. Native Amharic speaker.',
//     },
//     {
//       'name': 'Fatuma Mohammed',
//       'languageLearning': 'Amharic',
//       'languageSpeaking': 'Oromiffa',
//       'bio': 'Interested in learning Amharic culture. Fluent in Oromiffa.',
//     },
//     {
//       'name': 'John Smith',
//       'languageLearning': 'Amharic',
//       'languageSpeaking': 'English',
//       'bio':
//           'Trying to learn Amharic for my travels. Happy to help with English.',
//     },
//   ];

//   void _navigateToDashboard() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const Dashbord()),
//     );
//   }

//   Future<String> _createCall(String userName) async {
//     final callId = const Uuid().v4();
//     await FirebaseFirestore.instance.collection('calls').doc(callId).set({
//       'initiator': 'You', // Replace with actual user ID from auth
//       'recipient': userName,
//       'callId': callId,
//       'createdAt': Timestamp.now(),
//     });
//     return callId;
//   }

//   void _startVideoCall(BuildContext context, String userName) async {
//     try {
//       final callId = await _createCall(userName);
//       // Navigator.push(
//       //context,
//       // MaterialPageRoute(
//       //   builder:
//       //       (context) => VideoCallScreen(
//       //         userId: const Uuid().v4(),
//       //         userName: 'You', // Replace with actual user name from auth
//       //         callId: callId,
//       //       ),
//       // ),
//       //);
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Failed to start call: $e')));
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
//           translations['appBarTitleLanguageExchange'] ?? 'Language Exchange',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.deepPurple,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.deepPurple, Colors.purpleAccent],
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
//                     colors: [Colors.purple[50]!, Colors.white],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child:
//               users.isEmpty
//                   ? Center(
//                     child: Text(
//                       translations['noUsers'] ?? 'No users available.',
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   )
//                   : ListView.builder(
//                     itemCount: users.length,
//                     itemBuilder: (context, index) {
//                       final user = users[index];
//                       return Card(
//                         elevation: 4,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         margin: const EdgeInsets.symmetric(vertical: 6),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             gradient: LinearGradient(
//                               colors: [
//                                 isDarkMode ? Colors.grey[800]! : Colors.white,
//                                 isDarkMode
//                                     ? Colors.grey[800]!
//                                     : Colors.purple[50]!,
//                               ],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 12,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 user['name']!,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color:
//                                       isDarkMode
//                                           ? Colors.white
//                                           : Colors.black87,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 '${translations['learning'] ?? 'Learning'}: ${user['languageLearning']}',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color:
//                                       isDarkMode
//                                           ? Colors.grey[300]
//                                           : Colors.grey[700],
//                                 ),
//                               ),
//                               Text(
//                                 '${translations['speaking'] ?? 'Speaking'}: ${user['languageSpeaking']}',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color:
//                                       isDarkMode
//                                           ? Colors.grey[300]
//                                           : Colors.grey[700],
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 user['bio']!,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color:
//                                       isDarkMode
//                                           ? Colors.grey[300]
//                                           : Colors.grey[700],
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//                               Align(
//                                 alignment: Alignment.centerRight,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     _startVideoCall(context, user['name']!);
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.deepPurple,
//                                     foregroundColor: Colors.white,
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 24,
//                                       vertical: 12,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     translations['chatButton'] ?? 'Chat',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//         ),
//       ),
//     );
//   }
// }
