import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';
import 'package:diary/services/signup_form.dart';
import 'package:intl/intl.dart';

final now = new DateTime.now();
String day = DateFormat.d().format(now).toString();
String month = DateFormat.MMMM().format(now).toString();
String year = DateFormat.y().format(now).toString().toLowerCase();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: tertiaryColor,
        body: Stack(
          children: [
            CustomPaint(
              size: Size(400, (340 * 1.7777777777777777).toDouble()),
              painter: MyShape(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hello, Olivia! 👋',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20.0,
                          letterSpacing: 1.0,
                          fontFamily: 'SFPReg',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CircleAvatar(
                        maxRadius: 20,
                        minRadius: 20,
                        child: Image.asset(
                          'assets/comlogo.png',
                        ),
                      ),
                    ],
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
                          fontSize: 20.0,
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
                          fontSize: 20.0,
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
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: size.width,
                height: 60,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, (340 * 0.1875).toDouble()),
                      painter: BottomShape(),
                    ),
                    Center(
                      heightFactor: 0,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: primaryColor,
                        elevation: 0.1,
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: tertiaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.house,
                              size: 25,
                              color: primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.dashboard,
                              size: 25,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(width: size.width * 0.20),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.task,
                              size: 25,
                              color: primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.person,
                              size: 25,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      child: SizedBox(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Home',
                              style: TextStyle(
                                fontFamily: 'SFPReg',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                            const Text(
                              'For You',
                              style: TextStyle(
                                fontFamily: 'SFPReg',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.20,
                            ),
                            const Text(
                              'Tasks',
                              style: TextStyle(
                                fontFamily: 'SFPReg',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                            const Text(
                              'Profile',
                              style: TextStyle(
                                fontFamily: 'SFPReg',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                            //
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * 0.07),
        Offset(size.width * 0.50, size.height * 0.87),
        [secondaryColor, secondaryColor, tertiaryColor, tertiaryColor],
        [0.00, 0.52, 0.88, 1.00]);

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.1731875);
    path0.cubicTo(
        size.width * 0.0723889,
        size.height * 0.1529531,
        size.width * 0.1113611,
        size.height * 0.1929687,
        size.width * 0.1795000,
        size.height * 0.1996250);
    path0.cubicTo(
        size.width * 0.2925278,
        size.height * 0.2008437,
        size.width * 0.3416944,
        size.height * 0.1339219,
        size.width * 0.4049167,
        size.height * 0.1368125);
    path0.cubicTo(
        size.width * 0.4800556,
        size.height * 0.1311875,
        size.width * 0.5018889,
        size.height * 0.1959375,
        size.width * 0.5985833,
        size.height * 0.1998906);
    path0.cubicTo(
        size.width * 0.7906667,
        size.height * 0.2043594,
        size.width * 0.9134444,
        size.height * 0.0717656,
        size.width,
        size.height * 0.0849063);
    path0.quadraticBezierTo(size.width, size.height * 0.2679687, size.width,
        size.height * 0.8656250);
    path0.lineTo(0, size.height * 0.8625000);
    path0.quadraticBezierTo(
        0, size.height * 0.6573594, 0, size.height * 0.1731875);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.67),
        Offset(size.width, size.height * 0.67),
        [secondaryColor, purpleColor],
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(size.width * 0.0392125, 0);
    path0.quadraticBezierTo(size.width * 0.0042125, size.height * 0.0448667, 0,
        size.height * 0.2174667);
    path0.lineTo(0, size.height * 1.1074667);
    path0.quadraticBezierTo(size.width * 0.0033375, size.height * 1.2996667,
        size.width * 0.0406250, size.height * 1.3333333);
    path0.cubicTo(
        size.width * 0.2708250,
        size.height * 1.3333333,
        size.width * 0.7312250,
        size.height * 1.3333333,
        size.width * 0.9614250,
        size.height * 1.3333333);
    path0.quadraticBezierTo(size.width * 0.9940125, size.height * 1.3142667,
        size.width, size.height * 1.1151333);
    path0.lineTo(size.width, size.height * 0.2082667);
    path0.quadraticBezierTo(size.width * 0.9927000, size.height * 0.0216000,
        size.width * 0.9596125, 0);
    path0.cubicTo(size.width * 0.8767656, 0, size.width * 0.7079375, 0,
        size.width * 0.6250875, 0);
    path0.quadraticBezierTo(size.width * 0.5996875, size.height * 0.6570000,
        size.width * 0.4981625, size.height * 0.6668000);
    path0.quadraticBezierTo(size.width * 0.4002125, size.height * 0.6798000,
        size.width * 0.3749125, 0);
    path0.cubicTo(size.width * 0.2917750, 0, size.width * 0.2886250, 0,
        size.width * 0.0392125, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
