import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const tertiaryColor = Color.fromRGBO(255, 255, 255, 1);
const primaryColor = Color.fromRGBO(46, 96, 183, 1);
const purpleColor = Color(0xffE0C3FC);
const secondaryColor = Color(0xffECE6FF);
const blueColor = Color(0xffA7CBFC);
// DATE
final now = new DateTime.now();
String day = DateFormat.d().format(now).toString();
String month = DateFormat.MMMM().format(now).toString();
String year = DateFormat.y().format(now).toString().toLowerCase();
// FORMS
final nameController = TextEditingController();
final usernameController = TextEditingController();
final passwordController = TextEditingController();
bool passToggle = true;
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Full name is Required!';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is Required!';
  } else if (passwordController.text.length < 6) {
    return 'Password should be at least 6 characters!';
  }
  return null;
}

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is Required!';
  } else if (usernameController.text.length < 6) {
    return 'Username should be at least 6 characters!';
  }
  return null;
}
