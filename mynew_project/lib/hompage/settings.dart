import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/firstpage.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:provider/provider.dart';

import '../models/supported_language.dart';
import '../theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _navigateToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashbord()),
    );
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
          translations['appBarTitleSettings'] ?? 'Settings',
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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _navigateToDashboard,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient:
              isDarkMode
                  ? null
                  : LinearGradient(
                    colors: [Colors.green[50]!, Colors.yellow[50]!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        isDarkMode ? Colors.grey[800]! : Colors.white,
                        isDarkMode ? Colors.grey[800]! : Colors.yellow[50]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SwitchListTile(
                    title: Text(
                      translations['darkMode'] ?? 'Dark Mode',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (bool value) {
                      themeProvider.setThemeMode(value);
                    },
                    secondary: const Icon(
                      Icons.brightness_2,
                      color: Colors.grey,
                    ),
                    activeColor: Colors.green[800],
                    inactiveTrackColor: Colors.grey[700],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        isDarkMode ? Colors.grey[800]! : Colors.white,
                        isDarkMode ? Colors.grey[800]! : Colors.yellow[50]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SwitchListTile(
                    title: Text(
                      translations['offlineAccess'] ?? 'Offline Access',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    value: themeProvider.isOfflineAccessEnabled,
                    onChanged: (bool value) {
                      themeProvider.setOfflineAccess(value);
                    },
                    secondary: const Icon(Icons.download, color: Colors.grey),
                    activeColor: Colors.green[800],
                    inactiveTrackColor: Colors.grey[700],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        isDarkMode ? Colors.grey[800]! : Colors.white,
                        isDarkMode ? Colors.grey[800]! : Colors.yellow[50]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      translations['fontSize'] ?? 'Font Size',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      translations['fontSizeSubtitle']?.replaceAll(
                            '{size}',
                            themeProvider.fontSize.toStringAsFixed(1),
                          ) ??
                          'Current size: ${themeProvider.fontSize.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                      ),
                    ),
                    leading: const Icon(Icons.format_size, color: Colors.grey),
                    trailing: SizedBox(
                      width: 150,
                      child: Slider(
                        value: themeProvider.fontSize,
                        min: 12.0,
                        max: 24.0,
                        divisions: 4,
                        label: themeProvider.fontSize.toStringAsFixed(1),
                        activeColor: Colors.green[800],
                        inactiveColor: Colors.grey[700],
                        thumbColor: Colors.green[800],
                        onChanged: (double value) {
                          themeProvider.setFontSize(value);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        isDarkMode ? Colors.grey[800]! : Colors.white,
                        isDarkMode ? Colors.grey[800]! : Colors.yellow[50]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      translations['about'] ?? 'About',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    leading: const Icon(Icons.info, color: Colors.grey),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            backgroundColor: Colors.transparent,
                            content: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green[50]!,
                                    Colors.yellow[50]!,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    translations['appName'] ??
                                        'Language Learning App',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    translations['appVersion'] ??
                                        'Version 1.0.0',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.green,
                                    height: 20,
                                  ),
                                  Text(
                                    translations['aboutDescription'] ??
                                        'This app is designed to help you learn local Ethiopian languages.',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        translations['closeButton'] ?? 'Close',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
