import 'package:flutter/material.dart';
import 'package:diary/pages/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': ((context) => const Splash()),
    },
  ));
}
