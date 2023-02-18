import 'package:flutter/material.dart';
import 'package:diary/pages/splash_screen.dart';
import 'package:diary/pages/sign_up.dart';
import 'package:diary/pages/sign_in.dart';
import 'package:diary/pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': ((context) => const Splash()),
      'sign_up': ((context) => const SignUp()),
      'sign_in': ((context) => const SignIn()),
      'home': ((context) => const Home()),
    },
  ));
}
