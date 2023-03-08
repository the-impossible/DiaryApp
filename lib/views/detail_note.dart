import 'dart:ui' as ui;
import 'package:diary/controllers/detail_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailNote extends StatefulWidget {
  const DetailNote({super.key});

  @override
  State<DetailNote> createState() => _DetailNoteState();
}

class _DetailNoteState extends State<DetailNote> {
  DetailNoteController detailNoteController = Get.put(DetailNoteController());

  @override
  Widget build(BuildContext context) {
    String dateCreated = DateFormat("dd-MMM-yyy")
        .format(DateTime.parse("${detailNoteController.note?.dateCreated}"))
        .toString();
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, (340 * 1.7777777777777777).toDouble()),
                painter: MyShape(),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dateCreated,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 23.0,
                        fontFamily: 'SFPReg',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
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
              Positioned(
                left: 20,
                right: 20,
                top: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "${detailNoteController.note?.title}",
                        style: const TextStyle(
                          fontSize: 25,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Divider(color: primaryColor),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                top: 130,
                child: SizedBox(
                  width: size.width,
                  height: size.height * .6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            "${detailNoteController.note?.note}",
                            textAlign: ui.TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 17,
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: primaryColor,
                        thickness: 1,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  content: SizedBox(
                                    child: Image.memory(
                                      detailNoteController.note!.pic,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            child: Image.memory(
                              detailNoteController.note!.pic,
                              fit: BoxFit.contain,
                            ),
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
        backgroundColor: tertiaryColor,
      ),
    );
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  DetailNoteController detailNoteController = Get.put(DetailNoteController());
  return AppBar(
    leading: IconButton(
      onPressed: () => Get.back(),
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
          onPressed: () {
            detailNoteController.note_id =
                detailNoteController.note!.id.toString();
            detailNoteController.processFetchNote('edit');
          },
          child: const Text(
            'Edit',
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
