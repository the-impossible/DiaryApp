import 'package:flutter/material.dart';
import 'package:diary/pages/splash_screen.dart';
import 'package:diary/pages/sign_up.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': ((context) => const Splash()),
      'sign_up': ((context) => const SignUp()),
    },
  ));
}
