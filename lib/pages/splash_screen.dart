import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromRGBO(244, 242, 255, 1),
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/note.svg',
                fit: BoxFit.contain,
                width: 200,
              ),
              CustomPaint(
                size: Size(400, (640 * 1.8823529411764706).toDouble()),
                painter: MyShape(),
              ),
            ],
          ),
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
