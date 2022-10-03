String? idValidator(String? value) {
  if (isNotEmptyValidator(value) == null) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
      return "Only digits are allowed";
    } else {
      return null;
    }
  } else {
    return "This feild is required.";
  }
}

String? passwordValidator(String? value) {
  String? isNotEmpty = isNotEmptyValidator(value);
  if (isNotEmpty == null && value!.length >= 4) {
    return null;
  } else if (isNotEmpty != null) {
    return isNotEmpty;
  } else {
    return "Password must contain 6 or more character.";
  }
}

String? isNotEmptyValidator(String? value) {
  if (value != null && value.isNotEmpty) {
    return null;
  } else {
    return "This feild is required.";
  }
}

String? mobileValidator(String? value) {
  String? idVal = idValidator(value);
  if (idVal == null && value?.length == 10) {
    return null;
  } else if (value?.length != 10) {
    return "Plese enter 10 digit Contact No.";
  } else {
    return idVal;
  }
}

String? emailValidator(String? value) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);
  String? isNotEmpty = isNotEmptyValidator(value);
  if (isNotEmpty == null && emailValid) {
    return null;
  } else if (isNotEmpty != null) {
    return isNotEmpty;
  } else {
    return "Please enter correct Email Id.";
  }
}
