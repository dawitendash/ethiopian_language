import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/firstpage.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding.dart';
import 'theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBtwiva_-HAxPWOoNsAvW6YFhwOaRznoYk",
      authDomain: "lang-cbbc0.firebaseapp.com",
      projectId: "lang-cbbc0",
      storageBucket: "lang-cbbc0.firebasestorage.app",
      messagingSenderId: "406329604387",
      appId: "1:406329604387:web:8f34cf891efcdd3b8bb496",
      measurementId: "G-4KR7FWC578",
    ),
  );
  final prefs = await SharedPreferences.getInstance();
  final isFirstTime = prefs.getBool('isFirstTime') ?? true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(isFirstTime: isFirstTime),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({Key? key, required this.isFirstTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Language Learning App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'NotoSansEthiopic',
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: themeProvider.fontSize),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        fontFamily: 'NotoSansEthiopic',
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: themeProvider.fontSize),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      themeMode: themeProvider.themeMode,
      home: isFirstTime ? const OnboardingScreen() : const Dashbord(),
    );
  }
}
