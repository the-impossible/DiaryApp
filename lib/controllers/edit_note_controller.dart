import 'dart:io'; 
import 'package:diary/controllers/notes_controller.dart';
import 'package:diary/controllers/profile_controller.dart';
import 'package:diary/routes/routes.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:get/get.dart';
import 'package:diary/utils/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';

class EditNoteController extends GetxController {
  Preferences preferences = Preferences();

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  ProfileController profileController = Get.put(ProfileController());
  NotesController notesController = Get.put(NotesController());

  String? selectedEmotion;
  File? image;
  String? note_id;

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is Required!';
    }
    return null;
  }

  String? validateNote(String? value) {
    if (value == null || value.isEmpty) {
      return 'Note Content is Required!';
    }
    return null;
  }

  void submitNote() async {
    Get.showOverlay(
        asyncFunction: () => editNote(), loadingWidget: const Loading());
  }

  Future<void> editNote() async {
    Map token = await preferences.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };

      var url = Uri.parse(APIEndPoints.baseURL +
          APIEndPoints.authEndPoints.editNote +
          note_id!);

      var request = http.MultipartRequest('PUT', url);

      request.fields.addAll({
        'title': titleController.text,
        'note': noteController.text,
        'mood': selectedEmotion!,
        'user_id': "${profileController.userProfile?.id}",
      });

      if (image?.path != null) {
        request.files
            .add(await http.MultipartFile.fromPath('pic', image!.path));
      }

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Route to All notes page
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(
                output: 'Note Updated successfully!', isSuccess: true),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        Get.offNamed(Routes.home);
        titleController.clear();
        noteController.clear();
        notesController.processFetchNotes();
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(
                output: '${response.reasonPhrase}', isSuccess: false),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: CustomSnackBar(output: '$e', isSuccess: false),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }
}
