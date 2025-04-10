import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/views/home_page.dart';
import 'package:shopping_app/views/login_page.dart';
import 'package:shopping_app/widgets/customTextformfield.dart';
import 'package:shopping_app/widgets/custom_text.dart';
import 'package:shopping_app/widgets/passwordTextformfield.dart';
import 'package:shopping_app/widgets/validator_functions.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers for managing user input
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: CustomText(text: tr("signup"), fontSize: 32),
        actions: [
          IconButton(
            icon: Icon(Icons.language), // Language change icon
            onPressed: changeLanguage, // Change language when clicked
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the form
        child: Form(
          key: _formKey, // Connect form with form key for validation
          child: Center(
            child: ListView(
              shrinkWrap:
                  true, // Prevents the ListView from taking unnecessary space
              children: [
                // Email TextField with validation
                CustomTextField(
                  controller: emailController,
                  label: tr("email"),
                  prefixIcon: Icons.email,
                  validator: validateEmail, // Custom validation for email
                ),
                SizedBox(height: 16),

                // Name TextField with validation
                CustomTextField(
                  controller: nameController,
                  label: tr("name"),
                  prefixIcon: Icons.person,
                  validator:
                      validateFullName, // Custom validation for full name
                ),
                SizedBox(height: 16),

                // Password TextField with validation
                PasswordTextField(
                  controller: passwordController,
                  label: tr("password"),
                  prefixIcon: Icons.visibility,
                  validator: validatePassword, // Custom validation for password
                ),
                SizedBox(height: 16),

                // Confirm Password TextField with custom matching password validation
                PasswordTextField(
                  controller: confirmPasswordController,
                  label: tr("confirm password"),
                  prefixIcon: Icons.visibility,
                  validator: (value) {
                    // Ensures that password and confirm password match
                    if (value != passwordController.text) {
                      return tr("passwords don't match"); // Error message
                    }
                    return validatePassword(value); // Calls password validation
                  },
                ),

                SizedBox(height: 32),

                // SignUp button to submit the form
                ElevatedButton(
                  onPressed: () async {
                    // If the form is valid, proceed with the action
                    if (_formKey.currentState!.validate()) {
                      await myDialog();
                      // Delay navigation to simulate data processing
                      await Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 800),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    MyHomePage(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              return FadeTransition(
                                opacity: animation,
                                child: FadeTransition(
                                  opacity: Tween<double>(
                                    begin: 1.0,
                                    end: 0.0,
                                  ).animate(secondaryAnimation),
                                  child: child,
                                ),
                              );
                            },
                          ),
                        );
                      });

                      // Clear text fields after successful submission
                      emailController.clear();
                      passwordController.clear();
                      nameController.clear();
                      confirmPasswordController.clear();
                    } else {
                      // Show a snack bar indicating invalid form data
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(tr('Invalid Data'))),
                      );
                    }
                  },
                  child: Text(tr('signup')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeLanguage() {
    // Check current locale
    Locale currentLocale = context.locale;
    if (currentLocale.languageCode == 'en' &&
        currentLocale.countryCode == 'US') {
      // If the current language is English (US), switch to Arabic (EG)
      EasyLocalization.of(context)!.setLocale(Locale('ar', 'EG'));
    } else {
      // Otherwise, switch to English (US)
      EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
    }
  }

  Future<void> myDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr("hello")),
          content: Text(tr("welcome")),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
