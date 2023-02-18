import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';
import 'package:diary/services/signup_form.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tertiaryColor,
        body: SingleChildScrollView(
          child: Container(
            color: tertiaryColor,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(400, (340 * 1.7777777777777777).toDouble()),
                  painter: MyShape(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 35,
                        top: 10,
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
                      height: 100,
                    ),
                    Form(
                      child: Column(
                        children: [
                          SignUpForm(
                            text: 'Email',
                            icon: Icons.mail,
                            isSecured: false,
                          ),
                          SignUpForm(
                            text: 'Password',
                            icon: Icons.password,
                            isSecured: true,
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
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {},
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
                                  Navigator.popAndPushNamed(context, 'sign_up');
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
    );
  }
}