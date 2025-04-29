import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/firstpage.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:provider/provider.dart';

import '../models/supported_language.dart';
import '../theme_provider.dart';

class Audiolessonspage extends StatefulWidget {
  const Audiolessonspage({Key? key}) : super(key: key);

  @override
  _AudioLessonsPageState createState() => _AudioLessonsPageState();
}

class _AudioLessonsPageState extends State<Audiolessonspage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentAudio = '';

  Future<void> playAudio(
    String audioUrl,
    Map<String, dynamic> translations,
  ) async {
    try {
      if (isPlaying && currentAudio == audioUrl) {
        await audioPlayer.pause();
        setState(() {
          isPlaying = false;
        });
      } else {
        await audioPlayer.stop();
        await audioPlayer.play(
          AssetSource(audioUrl.replaceFirst('assets/', '')),
        );
        setState(() {
          isPlaying = true;
          currentAudio = audioUrl;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            translations['audioError'] ?? 'Failed to load audio file.',
          ),
        ),
      );
    }
  }

  void _navigateToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashbord()),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final translations = getTranslations(localeProvider.language);
    final lessons = getAudioLessons()[localeProvider.language] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations['appBarTitleAudioLessons'] ?? 'Audio Lessons',
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
        leading: IconButton(
          onPressed: _navigateToDashboard,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
          child:
              lessons.isEmpty
                  ? Center(
                    child: Text(
                      translations['noLessons'] ??
                          'No lessons available for ${getLanguageDisplayName(localeProvider.language)}.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  )
                  : ListView.builder(
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      final lesson = lessons[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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
                              lesson['title']!,
                              style: TextStyle(
                                fontSize: themeProvider.fontSize + 2,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            subtitle: Text(
                              lesson['description']!,
                              style: TextStyle(
                                fontSize: themeProvider.fontSize,
                                color: Colors.grey[700],
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                isPlaying && currentAudio == lesson['audioUrl']
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.green,
                              ),
                              onPressed:
                                  () => playAudio(
                                    lesson['audioUrl']!,
                                    translations,
                                  ),
                              tooltip:
                                  isPlaying &&
                                          currentAudio == lesson['audioUrl']
                                      ? 'Pause'
                                      : 'Play',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
