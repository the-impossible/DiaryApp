import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';
import 'package:diary/services/signup_form.dart';
import 'package:diary/services/home_decor.dart';

class TakeNote extends StatelessWidget {
  const TakeNote({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, (340 * 1.7777777777777777).toDouble()),
                painter: MyShape(),
              ),
              Positioned(
                right: 20,
                top: 80,
                child: SvgPicture.asset(
                  'assets/notebook.svg',
                  fit: BoxFit.contain,
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 23.0,
                        fontFamily: 'SFPReg',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      " $month,",
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 15.0,
                        fontFamily: 'SFPReg',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      " $year",
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 15.0,
                        fontFamily: 'SFPReg',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 70,
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Title',
                          hintStyle: TextStyle(
                            fontSize: 25,
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                        ),
                      ),
                      const TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Write more here...',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 70,
                        ),
                        child: Text(
                          'What is your current mood?  +',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 20,
                        ),
                        child: Text(
                          'Add photo                                 +',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
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
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Save',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'SFPBold',
              color: primaryColor,
            ),
          ),
        ),
      )
    ],
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
        Offset(size.width * 0.50, size.height * -0.02),
        Offset(size.width * 0.50, size.height * 0.73), [
      purpleColor,
      secondaryColor,
      tertiaryColor,
      tertiaryColor,
    ], [
      0.00,
      0.40,
      0.72,
      1.00
    ]);

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0599844);
    path0.cubicTo(
        size.width * 0.0941944,
        size.height * 0.0337344,
        size.width * 0.1278056,
        size.height * 0.0948594,
        size.width * 0.1904167,
        size.height * 0.1057344);
    path0.cubicTo(
        size.width * 0.2653611,
        size.height * 0.1206250,
        size.width * 0.3290278,
        size.height * 0.0822187,
        size.width * 0.3729167,
        size.height * 0.0600469);
    path0.cubicTo(
        size.width * 0.5326389,
        size.height * -0.0200781,
        size.width * 0.5946389,
        size.height * 0.1088906,
        size.width * 0.6805556,
        size.height * 0.1296719);
    path0.cubicTo(
        size.width * 0.8496667,
        size.height * 0.1595625,
        size.width * 0.8513889,
        size.height * 0.0347812,
        size.width,
        size.height * -0.0015781);
    path0.quadraticBezierTo(size.width, size.height * 0.1808750, size.width,
        size.height * 0.7282344);
    path0.lineTo(0, size.height * 0.7311719);
    path0.quadraticBezierTo(
        0, size.height * 0.5633750, 0, size.height * 0.0599844);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
