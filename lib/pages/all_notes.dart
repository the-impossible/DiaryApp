import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';
import 'package:diary/services/signup_form.dart';
import 'package:diary/services/list_notes.dart';

class AllNotes extends StatelessWidget {
  const AllNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  CustomPaint(
                    size:
                        Size(size.width, (340 * 1.7777777777777777).toDouble()),
                    painter: MyShape(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/note.svg',
                        fit: BoxFit.contain,
                        height: 60,
                      ),
                      const Text(
                        'Notes',
                        style: TextStyle(
                          fontSize: 22,
                          color: primaryColor,
                          fontFamily: 'SFPBold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: primaryColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: Column(
                    children: [
                      ListNotes(
                          constraints: constraints,
                          title: '5 Ways To Improve Your Self Esteem'),
                      ListNotes(
                          constraints: constraints,
                          title: 'How to Start Sleeping Better Than Ever'),
                      ListNotes(
                          constraints: constraints,
                          title: 'Personality Growth and Career Success'),
                      ListNotes(
                          constraints: constraints,
                          title: 'Dealing With Anxiety And Stress'),
                      ListNotes(
                          constraints: constraints,
                          title: 'Trusting Feelings Over Facts'),
                      ListNotes(
                          constraints: constraints,
                          title: 'Trusting Feelings Over Facts'),
                      ListNotes(
                          constraints: constraints,
                          title: 'Trusting Feelings Over Facts'),
                      ListNotes(
                          constraints: constraints,
                          title: 'Trusting Feelings Over Facts'),
                      ListNotes(
                          constraints: constraints,
                          title: 'Trusting Feelings Over Facts'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: tertiaryColor,
      ),
    );
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        size: 28,
        color: primaryColor,
      ),
    ),
    backgroundColor: tertiaryColor,
    elevation: 0,
  );
}

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.54, size.height * 0.01),
        Offset(size.width * 0.54, size.height * 0.73),
        [purpleColor, secondaryColor, tertiaryColor, tertiaryColor],
        [0.00, 0.40, 0.72, 1.00]);

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0455938);
    path0.cubicTo(
        size.width * 0.0962222,
        size.height * 0.0074688,
        size.width * 0.7389167,
        size.height * 0.2079219,
        size.width,
        size.height * 0.1042500);
    path0.quadraticBezierTo(size.width * 1.0807778, size.height * 0.2904687,
        size.width, size.height * 0.7282344);
    path0.lineTo(0, size.height * 0.7311719);
    path0.quadraticBezierTo(
        0, size.height * 0.5489844, 0, size.height * 0.0455938);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
