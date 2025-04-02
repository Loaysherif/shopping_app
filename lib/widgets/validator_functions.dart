// Validates full name (ensures first letter of each word is capitalized)
String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  }
  value = value.trim(); // Removes extra spaces before and after the name

  // Regular expression to check if each word starts with a capital letter
  final nameRegExp = RegExp(r'^[A-Z][a-z]*(\s[A-Z][a-z]*)*$');
  if (!nameRegExp.hasMatch(value)) {
    return 'Each word should start with a capital letter';
  }
  return null; // Returns null if the input is valid
}

// Validates email format
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  value = value.trim(); // Removes extra spaces

  // Regular expression to check valid email format
  final emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null; // Returns null if the input is valid
}

// Validates password (minimum 8 characters, 1 uppercase, 1 lowercase, 1 digit, 1 special character)
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  value = value.trim(); // Removes extra spaces

  // Regular expression to check password strength
  final passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*])[A-Za-z\d!@#\$%^&*]{8,}$',
  );
  if (!passwordRegExp.hasMatch(value)) {
    return 'Password must be at least 8 characters, include 1 uppercase, 1 lowercase, 1 digit, and 1 special character';
  }
  return null; // Returns null if the input is valid
}
