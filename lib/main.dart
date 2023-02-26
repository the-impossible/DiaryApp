import 'package:diary/pages/take_note.dart';
import 'package:diary/pages/all_notes.dart';
import 'package:flutter/material.dart';
import 'package:diary/pages/splash_screen.dart';
import 'package:diary/pages/sign_up.dart';
import 'package:diary/pages/sign_in.dart';
import 'package:diary/pages/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': ((context) => const Splash()),
      'sign_up': ((context) => const SignUp()),
      'sign_in': ((context) => const SignIn()),
      'home': ((context) => const Home()),
      'take_note': ((context) => const TakeNote()),
      'all_notes': ((context) => const AllNotes()),
    },
  ));
}
