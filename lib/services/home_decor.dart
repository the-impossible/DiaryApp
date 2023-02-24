import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';

class HomeDecor extends StatelessWidget {
  final double height;
  final BoxConstraints constraints;
  final String title;
  final String svg;

  const HomeDecor(
      {required this.height,
      required this.constraints,
      required this.title,
      required this.svg,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * height,
      width: constraints.maxWidth * .4,
      decoration: const BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: ui.Color.fromARGB(255, 202, 202, 202),
              blurRadius: 6,
              spreadRadius: 2.0,
              offset: ui.Offset(0, 0),
            ),
          ]),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: tertiaryColor,
                  fontFamily: 'SFPReg',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: SvgPicture.asset(
                svg,
                fit: BoxFit.contain,
                height: constraints.maxHeight * .2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
