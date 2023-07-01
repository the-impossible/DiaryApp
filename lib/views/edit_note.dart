import 'dart:io';
import 'dart:ui' as ui;
import 'package:diary/controllers/detail_note_controller.dart';
import 'package:diary/controllers/mood_controller.dart';
import 'package:diary/controllers/edit_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary/services/constants.dart';
import 'package:get/get.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:image_picker/image_picker.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  File? image;

  final MoodController moodController = Get.put(MoodController());
  EditNoteController editNoteController = Get.put(EditNoteController());
  DetailNoteController detailNoteController = Get.put(DetailNoteController());

  Future pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile == null) return;

      setState(() {
        image = File(pickedFile.path);
        editNoteController.image = image;
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: CustomSnackBar(
              output: "Failed to Capture image: $e", isSuccess: false),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    EditNoteController editNoteController = Get.put(EditNoteController());
    DetailNoteController detailNoteController = Get.put(DetailNoteController());
    editNoteController.titleController.text = detailNoteController.note!.title;
    editNoteController.noteController.text = detailNoteController.note!.note;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context, _formKey),
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
                  key: _formKey,
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
                        controller: editNoteController.titleController,
                        validator: editNoteController.validateTitle,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        controller: editNoteController.noteController,
                        validator: editNoteController.validateNote,
                        textAlign: ui.TextAlign.justify,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Write more here...',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 20,
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Current mood?',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 180,
                                  child: MoodDropdownMenu(),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text(
                                  'Add photo ?',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt_rounded,
                                    color: primaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () => pickImage(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                image != null
                                    ? Image.file(
                                        image!,
                                        fit: BoxFit.contain,
                                        height: size.height * .2,
                                        width: size.width * .3,
                                      )
                                    : detailNoteController.note?.pic != null
                                        ? Image.memory(
                                            detailNoteController.note!.pic,
                                            height: size.height * .2,
                                            width: size.width * .3,
                                          )
                                        : Image.asset(
                                            "assets/default.jpg",
                                            fit: BoxFit.contain,
                                            height: size.height * .2,
                                            width: size.width * .3,
                                          ),
                              ],
                            ),
                          ],
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

class MoodDropdownMenu extends StatefulWidget {
  const MoodDropdownMenu({super.key});

  @override
  State<MoodDropdownMenu> createState() => _MoodDropdownMenuState();
}

class _MoodDropdownMenuState extends State<MoodDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    MoodController moodController = Get.put(MoodController());
    DetailNoteController detailNoteController = Get.put(DetailNoteController());

    EditNoteController editNoteController = Get.put(EditNoteController());

    String? selectedEmotion;
    for (var element in moodController.moods) {
      if (element.mood == detailNoteController.note!.mood) {
        selectedEmotion = element.id.toString();
      }
    }
    editNoteController.selectedEmotion = selectedEmotion;

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
      ),
      value: selectedEmotion,
      hint: const Text('Select an emotion'),
      onChanged: (String? newValue) {
        setState(() {
          selectedEmotion = newValue!;
          editNoteController.selectedEmotion = selectedEmotion;
        });
      },
      items: moodController.moods
          .map((entries) => DropdownMenuItem<String>(
                value: entries.id.toString(),
                child: Text(entries.mood),
              ))
          .toList(),
    );
  }
}

PreferredSizeWidget _appBar(BuildContext context, formKey) {
  EditNoteController editNoteController = Get.put(EditNoteController());
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
            if (formKey.currentState!.validate()) {}
            editNoteController.submitNote();
            editNoteController.note_id =
                detailNoteController.note!.id.toString();
          },
          child: const Text(
            'Update',
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
