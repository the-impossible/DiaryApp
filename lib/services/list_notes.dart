import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';

class ListNotes extends StatelessWidget {
  final BoxConstraints constraints;
  final String title;

  const ListNotes({required this.constraints, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 10,
      ),
      child: Container(
        height: constraints.maxHeight * .15,
        width: constraints.maxWidth,
        decoration: const BoxDecoration(
          color: blueColor,
          boxShadow: [
            BoxShadow(
              color: ui.Color.fromARGB(255, 224, 224, 224),
              blurRadius: 6,
              spreadRadius: 2.0,
              offset: ui.Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: tertiaryColor,
              fontSize: 20,
              fontFamily: 'SFPReg',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
