import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:diary/controllers/registration_controller.dart';

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
bool passToggle = true;
