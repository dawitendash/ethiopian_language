import 'package:flutter/material.dart';
import 'package:mynew_project/hompage/locale_provider.dart';
import 'package:mynew_project/models/supported_language.dart';
import 'package:provider/provider.dart';

import 'sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  String? passwordValidation(String? value, Map<String, dynamic> translations) {
    if (value == null || value.isEmpty) {
      return translations['enterPassword'] ?? 'Please enter a password';
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*[\d@$!%*?&]).{6,}$').hasMatch(value)) {
      return translations['passwordCriteria'] ??
          'Password must be 6+ chars, with letters and numbers/symbols';
    }
    return null;
  }

  String? emailValidation(String? value, Map<String, dynamic> translations) {
    if (value == null || value.isEmpty) {
      return translations['enterEmail'] ?? 'Please enter an email';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return translations['validEmail'] ?? 'Please enter a valid email address';
    }
    return null;
  }

  String? fullNameValidation(String? value, Map<String, dynamic> translations) {
    if (value == null || value.isEmpty) {
      return translations['enterFullName'] ?? 'Please enter your full name';
    }
    if (value.trim().length <= 4) {
      return translations['fullNameLength'] ??
          'Full name must be more than 4 characters';
    }
    return null;
  }

  String? confirmPasswordValidation(
    String? value,
    Map<String, dynamic> translations,
  ) {
    if (value == null || value.isEmpty) {
      return translations['confirmPassword'] ?? 'Please confirm your password';
    }
    if (_passwordController.text != value) {
      return translations['passwordsNoMatch'] ?? 'Passwords do not match';
    }
    return null;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
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

  void _handleSignUp() {
    final translations = getTranslations(
      Provider.of<LocaleProvider>(context, listen: false).language,
    );
    if (_formKey.currentState?.validate() ?? false) {
      print('Full Name: ${_fullNameController.text}');
      print('Email: ${_emailController.text}');
      print(
        'Selected Language: ${getLanguageDisplayName(Provider.of<LocaleProvider>(context, listen: false).language)}',
      );

      // TODO: Implement actual sign-up logic (e.g., Firebase)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            translations['signUpSuccess'] ??
                'Sign Up Successful! Redirecting to Login...',
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    translations['createAccount'] ?? 'Create Your Account',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 30.0,
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
                            controller: _fullNameController,
                            validator:
                                (value) =>
                                    fullNameValidation(value, translations),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                                size: 26,
                              ),
                              labelText:
                                  translations['fullNameLabel'] ?? 'Full Name',
                              hintText:
                                  translations['fullNameHint'] ??
                                  'Enter your full name',
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
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _emailController,
                            validator:
                                (value) => emailValidation(value, translations),
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
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _passwordController,
                            validator:
                                (value) =>
                                    passwordValidation(value, translations),
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
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _confirmPasswordController,
                            validator:
                                (value) => confirmPasswordValidation(
                                  value,
                                  translations,
                                ),
                            obscureText: !_isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                                size: 26,
                              ),
                              labelText:
                                  translations['confirmPasswordLabel'] ??
                                  'Confirm Password',
                              hintText:
                                  translations['confirmPasswordHint'] ??
                                  'Re-enter your password',
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
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                  size: 26,
                                ),
                                onPressed: _toggleConfirmPasswordVisibility,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          ElevatedButton(
                            onPressed: _handleSignUp,
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
                              translations['signUpButton'] ?? 'Sign Up',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
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
                        translations['alreadyHaveAccount'] ??
                            'Already have an account? ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          translations['signInLink'] ?? 'Sign In',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
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
