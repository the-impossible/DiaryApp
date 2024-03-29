import 'dart:ui' as ui;
import 'package:diary/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:diary/services/constants.dart';
import 'package:diary/services/signup_form.dart';
import 'package:diary/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= const Duration(seconds: 2);
          timeBackPressed = DateTime.now();

          if (isExitWarning) {
            const message = 'Press back again to exit';
            Fluttertoast.showToast(msg: message, fontSize: 18);
            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: tertiaryColor,
          body: SingleChildScrollView(
            child: Container(
              color: tertiaryColor,
              child: Stack(
                children: [
                  CustomPaint(
                    size:
                        Size(size.width, (340 * 1.7777777777777777).toDouble()),
                    painter: MyShape(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Deary',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              fontSize: 35,
                              fontFamily: 'Pacifico-Regular',
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 35,
                          top: 25,
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontSize: 30,
                            fontFamily: 'Pacifico-Regular',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SignUpForm(
                              text: 'Username',
                              icon: Icons.manage_accounts,
                              isSecured: false,
                              formController:
                                  loginController.usernameController,
                              isVisible: false,
                              validator: loginController.validateUsername,
                            ),
                            SignUpForm(
                              text: 'Password',
                              icon: Icons.password,
                              isSecured: true,
                              formController:
                                  loginController.passwordController,
                              isVisible: true,
                              validator: loginController.validatePassword,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forget password?',
                                      style: TextStyle(
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'SFPReg',
                                        color: primaryColor,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 10,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      loginController.verifyLogin();
                                    }
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontFamily: 'SFPBold',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'SFPReg',
                                    color: primaryColor,
                                    letterSpacing: 1,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.offAndToNamed(Routes.signUp);
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'SFPReg',
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.49, size.height * 0.07),
        Offset(size.width * 0.49, size.height * 0.86),
        [secondaryColor, secondaryColor, tertiaryColor],
        [0.00, 0.66, 1.00]);

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0789062);
    path0.cubicTo(
        size.width * 0.1456667,
        size.height * 0.0650469,
        size.width * 0.0878056,
        size.height * 0.1607031,
        size.width * 0.2763889,
        size.height * 0.1613594);
    path0.cubicTo(
        size.width * 0.4997778,
        size.height * 0.1214375,
        size.width * 0.4917222,
        size.height * 0.1974063,
        size.width * 0.6013889,
        size.height * 0.2046875);
    path0.quadraticBezierTo(size.width * 0.8399444, size.height * 0.2147500,
        size.width, size.height * 0.0730469);
    path0.lineTo(size.width, size.height * 0.8597656);
    path0.lineTo(0, size.height * 0.8648438);
    path0.quadraticBezierTo(size.width * -0.0138889, size.height * 0.5740312, 0,
        size.height * 0.0789062);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
