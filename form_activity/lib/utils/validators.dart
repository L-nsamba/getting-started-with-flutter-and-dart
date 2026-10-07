class Validators {
  /// Validates emails: checks for “something@something.something”,

  static String? emailValidator(String? value) =>
      (value == null ||
          value.trim().isEmpty || // nothing typed
          !RegExp(r'^\S+@\S+\.\S+$').hasMatch(value)) // fails basic pattern
      ? 'Enter a valid email'
      : null;

  /// Validates username: not empty, minimum 10 characters
  static String? usernameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    } else if (value.trim().length < 10) {
      return 'Username must be 10 char long';
    }
    return null;

  }

    /// TODO: add a function for validating phone numbers below
  static String? phoneNumberValidator(String? value) =>
      (value == null ||
          value.trim().isEmpty || // nothing typed
          !RegExp(r'^(09)\d{8}$').hasMatch(value)) // fails basic pattern
      ? 'Enter a valid phone number'
      : null;
  

  /// Validates password: not empty, 8+ chars, uppercase, digit, special char
  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    final password = value.trim();

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one number';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  /// At least one course must be selected
  static String? courseValidator(List<String> selectedCourses) {
    if (selectedCourses.isEmpty) {
      return 'Please select at least one course';
    }
    return null;
  }

  /// Tuition must be greater than 0
  static String? tuitionValidator(double value) {
    if (value <= 0) {
      return 'Please adjust the tuition slider';
    }
    return null;
  }
}
