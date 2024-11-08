import 'dart:core';

extension ExtendedString on String {
  String? validateEmail() {
    if (trim().isEmpty) {
      return 'Please enter your email address';
    }
    // Check if the entered email has the right format
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(this)) {
      return '🚩Please enter a valid email address';
    }
    // Return null if the entered email is valid
    return null;
  }

  String? validatePassword() {
    RegExp hasUpper = RegExp(r'[A-Z]');
    RegExp hasLower = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');
    RegExp hasPunct = RegExp(r'[!@#$&*~-]');
    // 2
    if (!RegExp(r'.{8,}').hasMatch(this)) {
      return 'Passwords must have at least 8 characters';
    }
    // 3
    if (!hasUpper.hasMatch(this)) {
      return 'Passwords must have at least one uppercase character';
    }
    // 4
    if (!hasLower.hasMatch(this)) {
      return 'Passwords must have at least one lowercase character';
    }
    // 5
    if (!hasDigit.hasMatch(this)) {
      return 'Passwords must have at least one number';
    }
    // 6
    if (!hasPunct.hasMatch(this)) {
      return 'Passwords need at least one special character like !@#\$&*~-';
    }
    // 7
    return null;
  }

  String? validateAccountNumber() {
    if (trim().isEmpty) {
      return 'Please enter your Account Number';
    }
    // Check if the entered email has the right format
    if (length < 7 || length > 8) {
      return '🚩Please enter a valid Account Number';
    }
    // Return null if the entered email is valid
    return null;
  }

  String? validateUserName() {
    if (trim().isEmpty) {
      return 'Please enter your name';
    }
    if (trim().length < 3) {
      return 'Please enter valid name';
    }
    return null;
  }

  String? validatePhoneNumber() {
    if (trim().isEmpty) {
      return '📱Please enter Phone Number';
    }
    if (trim().length < 10 || length > 15) {
      return 'Please enter valid Phone Number';
    }

    // Return null if the entered password is valid
    return null;
  }

  String? validateCode() {
    if (trim().isEmpty) {
      return 'This field is required';
    }
    if (trim().length < 5) {
      return 'Code must be at least 5 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }
}
