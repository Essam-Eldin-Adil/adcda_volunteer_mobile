class Validators {
  static String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) return 'Enter a valid email';
    return null;
  }
}
