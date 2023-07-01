import 'package:diary/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:diary/services/constants.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splashIconSize: 250,
        centered: true,
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        animationDuration: const Duration(
          seconds: 1,
        ),
        nextScreen: const SignIn(),
        backgroundColor: secondaryColor,
        splash: Column(
          children: [
            Image.asset(
              'assets/logo.png',
            ),
            const Text(
              'Deary',
              style: TextStyle(
                color: Color.fromRGBO(46, 96, 183, 1),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                fontSize: 40,
                fontFamily: 'Pacifico-Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromRGBO(233, 243, 253, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.340000033378601;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(
      size.width * 0.0004412,
      size.height * 0.3905781,
    );
    path0.quadraticBezierTo(
      size.width * 0.0740588,
      size.height * 0.4008750,
      size.width * 0.3632647,
      size.height * 0.5580469,
    );
    path0.quadraticBezierTo(
      size.width * 0.6025000,
      size.height * 0.6870625,
      size.width,
      size.height * 0.5530469,
    );
    path0.lineTo(
      size.width,
      size.height,
    );
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
