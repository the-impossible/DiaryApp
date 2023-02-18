import 'package:flutter/material.dart';
import 'package:diary/services/constants.dart';

class SignUpForm extends StatelessWidget {
  final String text;
  final IconData icon;
  bool isSecured;

  SignUpForm(
      {required this.text, required this.icon, required this.isSecured, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 20,
      ),
      child: TextFormField(
        obscureText: isSecured,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          fillColor: tertiaryColor,
          filled: true,
          label: Text(text),
          prefixIcon: Icon(
            icon,
            color: primaryColor,
          ),
          labelStyle: const TextStyle(
            color: primaryColor,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
