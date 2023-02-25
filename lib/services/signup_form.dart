import 'package:flutter/material.dart';
import 'package:diary/services/constants.dart';

class SignUpForm extends StatefulWidget {
  final String text;
  final IconData icon;
  final TextEditingController formController;
  final String? Function(String?)? validator;
  bool isSecured;
  bool isVisible;

  SignUpForm({
    required this.text,
    required this.icon,
    required this.isSecured,
    required this.formController,
    required this.isVisible,
    this.validator,
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

bool passToggle = false;

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 20,
      ),
      child: TextFormField(
        controller: widget.formController,
        obscureText: widget.isSecured ? passToggle : widget.isSecured,
        validator: widget.validator,
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
          label: Text(widget.text),
          suffix: Visibility(
            visible: widget.isVisible,
            child: InkWell(
              onTap: () {
                setState(() {
                  passToggle = !passToggle;
                });
              },
              child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          prefixIcon: Icon(
            widget.icon,
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
