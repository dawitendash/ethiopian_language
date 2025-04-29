import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:mynew_project/models/supported_language.dart';
import 'package:provider/provider.dart';

import 'SIgn_up.dart';
import 'homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  bool _validateEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  void _handleSignIn() {
    final translations = getTranslations(
      Provider.of<LocaleProvider>(context, listen: false).language,
    );
    if (_formKey.currentState?.validate() ?? false) {
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print(
        'Selected Language: ${getLanguageDisplayName(Provider.of<LocaleProvider>(context, listen: false).language)}',
      );

      // TODO: Implement actual sign-in logic (e.g., Firebase, API)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void _goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _onLanguageSelected(SupportedLanguage selected) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    final translations = getTranslations(selected);
    final langName = getLanguageDisplayName(selected);
    localeProvider.setLocale(selected);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          (translations['languageSet'] ?? 'Interface language set to {lang}')
              .replaceFirst('{lang}', langName),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final translations = getTranslations(localeProvider.language);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 70, 90),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<SupportedLanguage>(
            icon: const Icon(Icons.language, color: Colors.white),
            tooltip: "Select Language",
            onSelected: _onLanguageSelected,
            itemBuilder: (BuildContext context) {
              return SupportedLanguage.values.map((SupportedLanguage choice) {
                return PopupMenuItem<SupportedLanguage>(
                  value: choice,
                  child: Text(getLanguageDisplayName(choice)),
                );
              }).toList();
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 80, 70, 90), Color(0xff281537)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
              top: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    translations['welcomeSignIn'] ?? 'Hello, Welcome back!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translations['loginContinue'] ?? 'Login to Continue!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: Colors.white70),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 40.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                                size: 26,
                              ),
                              labelText: translations['emailLabel'] ?? 'Email',
                              hintText:
                                  translations['emailHint'] ??
                                  'Enter your email address',
                              labelStyle: const TextStyle(fontSize: 14),
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 16,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return translations['enterEmail'] ??
                                    'Please enter your email';
                              } else if (!_validateEmail(value)) {
                                return translations['validEmail'] ??
                                    'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 13),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                                size: 26,
                              ),
                              labelText:
                                  translations['passwordLabel'] ?? 'Password',
                              hintText:
                                  translations['passwordHint'] ??
                                  'Enter your password',
                              labelStyle: const TextStyle(fontSize: 14),
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 16,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                  size: 26,
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return translations['enterPassword'] ??
                                    'Please enter your password';
                              } else if (!_validatePassword(value)) {
                                return translations['passwordLength'] ??
                                    'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                print("Forgot Password pressed");
                                // TODO: Implement forgot password logic
                              },
                              child: Text(
                                translations['forgotPassword'] ??
                                    'Forgot Password?',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 35, 35, 180),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: _handleSignIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                35,
                                35,
                                180,
                              ),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minimumSize: const Size(double.infinity, 56),
                            ),
                            child: Text(
                              translations['signInButton'] ?? 'Sign In',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              const Expanded(child: Divider(thickness: 1)),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0,
                                ),
                                child: Text(
                                  translations['orDivider'] ?? 'OR',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: const Icon(
                                    Icons.facebook,
                                    color: Colors.blueAccent,
                                    size: 24,
                                  ),
                                  label: Text(
                                    translations['facebookButton'] ??
                                        'Facebook',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  onPressed: () {
                                    // TODO: Implement Facebook Login
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black87,
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: Image.asset(
                                    'assets/images/download.png',
                                    height: 22,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                            ),
                                  ),
                                  label: Text(
                                    translations['googleButton'] ?? 'Google',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  onPressed: () {
                                    // TODO: Implement Google Login
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black87,
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        translations['noAccount'] ?? "Don't have an account? ",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      TextButton(
                        onPressed: _goToSignUp,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          translations['signUpLink'] ?? "Sign Up",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
