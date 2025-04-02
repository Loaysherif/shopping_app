import 'package:flutter/material.dart';
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
        title: CustomText(text: "Sign Up", fontSize: 32),
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
                  label: "Email",
                  prefixIcon: Icons.email,
                  validator: validateEmail, // Custom validation for email
                ),
                SizedBox(height: 16),

                // Name TextField with validation
                CustomTextField(
                  controller: nameController,
                  label: "Name",
                  prefixIcon: Icons.person,
                  validator:
                      validateFullName, // Custom validation for full name
                ),
                SizedBox(height: 16),

                // Password TextField with validation
                PasswordTextField(
                  controller: passwordController,
                  label: "Password",
                  prefixIcon: Icons.visibility,
                  validator: validatePassword, // Custom validation for password
                ),
                SizedBox(height: 16),

                // Confirm Password TextField with custom matching password validation
                PasswordTextField(
                  controller: confirmPasswordController,
                  label: "Confirm Password",
                  prefixIcon: Icons.visibility,
                  validator: (value) {
                    // Ensures that password and confirm password match
                    if (value != passwordController.text) {
                      return "Passwords do not match"; // Error message
                    }
                    return validatePassword(value); // Calls password validation
                  },
                ),

                SizedBox(height: 32),

                // SignUp button to submit the form
                ElevatedButton(
                  onPressed: () {
                    // If the form is valid, proceed with the action
                    if (_formKey.currentState!.validate()) {
                      // Show a snack bar indicating data is being processed
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );

                      // Delay navigation to simulate data processing
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      });

                      // Clear text fields after successful submission
                      emailController.clear();
                      passwordController.clear();
                      nameController.clear();
                      confirmPasswordController.clear();
                    } else {
                      // Show a snack bar indicating invalid form data
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Invalid Data')));
                    }
                  },
                  child: Text('SignUp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
