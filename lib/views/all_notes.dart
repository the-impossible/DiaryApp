import 'dart:ui' as ui;
import 'package:diary/controllers/delete_note_controller.dart';
import 'package:diary/controllers/detail_note_controller.dart';
import 'package:diary/controllers/notes_controller.dart';
import 'package:diary/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';
import 'package:get/get.dart';

class AllNotes extends StatelessWidget {
  AllNotes({super.key});

  DetailNoteController detailNoteController = Get.put(DetailNoteController());
  DeleteNoteController deleteNoteController = Get.put(DeleteNoteController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: _appBar(context),
        body: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: primaryColor,
                  ),
                );
              }),
              Stack(
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
                  Positioned(
                    top: size.height * .12,
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GetX<NotesController>(
                              builder: (controller) {
                                return ListView.builder(
                                  itemCount: controller.notes.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () async {
                                        detailNoteController.note_id =
                                            controller.notes[index].id
                                                .toString();
                                        detailNoteController
                                            .processFetchNote('details');
                                      },
                                      child: Card(
                                        margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 20,
                                            right: 20),
                                        elevation: 3,
                                        color: tertiaryColor,
                                        shadowColor: primaryColor,
                                        child: ListTile(
                                          leading: Text(controller
                                              .notes[index].mood
                                              .split(" ")
                                              .last),
                                          title: Text(
                                            controller.notes[index].title,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'SFPReg',
                                                fontWeight: FontWeight.normal),
                                          ),
                                          trailing: Wrap(
                                            spacing: 10,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  detailNoteController.note_id =
                                                      controller.notes[index].id
                                                          .toString();
                                                  detailNoteController
                                                      .processFetchNote('edit');
                                                },
                                                child: const Icon(Icons.edit,
                                                    color: Colors.green),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  deleteNoteController.note_id =
                                                      controller.notes[index].id
                                                          .toString();
                                                  deleteNoteController
                                                      .processDeleteNote();
                                                  print('Deleted!');
                                                },
                                                child: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
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
