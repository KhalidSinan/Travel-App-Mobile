String? validatePassword(data) {
  if (data!.isEmpty) {
    return 'this field is required';
  }
  if (data!.length < 8) {
    return "password must be at least 8 characters";
  }
  return null;
}

String? validateEmail(data) {
  RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (data!.isEmpty) {
    return 'this field is required';
  } else if (!regex.hasMatch(data)) {
    return 'invalid email';
  }
  return null;
}

String? validateName(data) {
  if (data!.isEmpty) {
    return 'this field is required';
  }
  return null;
}

String? validateCode(value) {
  if (value!.isEmpty) {
    return 'this field is required';
  }
  if (value.length != 6) {
    return 'code must consist of 6 digits';
  }
  return null;
}
