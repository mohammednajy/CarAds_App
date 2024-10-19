extension ValidationExtensions on String {
  String? get isValidEmail {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (isEmpty) {
      return 'required field';
    } else if (!(emailRegex.hasMatch(this))) {
      return 'invalid email';
    }
    return null;
  }
}
