import 'package:diary/controllers/notes_controller.dart';
import 'package:diary/routes/routes.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:get/get.dart';
import 'package:diary/utils/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';

class DeleteNoteController extends GetxController {
  Preferences preferences = Preferences();

  NotesController notesController = Get.put(NotesController());

  String? note_id;

  void processDeleteNote() async {
    Get.showOverlay(
        asyncFunction: () => deleteNote(), loadingWidget: const Loading());
  }

  Future<void> deleteNote() async {
    Map token = await preferences.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };

      var url = Uri.parse(APIEndPoints.baseURL +
          APIEndPoints.authEndPoints.deleteNote +
          note_id!);

      var request = http.Request('DELETE', url);

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Route to All notes page
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(
                output: 'Note Delete successfully!', isSuccess: true),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        Get.offNamed(Routes.home);
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
