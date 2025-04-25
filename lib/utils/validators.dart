String? emailValidator(value) {

  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}


String? passwordValidator(value) {

  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}


String? fullnameValidator(value) {

  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  }
  return null;
}

String? isEmptyValidator(value) {

  if (value == null || value.isEmpty) {
    return 'Empty Field';
  }
  return null;
}
