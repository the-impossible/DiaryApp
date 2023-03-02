import 'dart:convert';
import 'dart:io';
import 'package:diary/controllers/profile_controller.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:diary/utils/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class TakeNoteController extends GetxController {
  Preferences preferences = Preferences();

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  ProfileController profileController = Get.put(ProfileController());

  String? selectedEmotion;
  File? image;

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

  Future<void> takeNote() async {
    Map token = await preferences.getToken();
    final bytes = image!.readAsBytesSync();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };

      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.takeNote);

      var request = http.MultipartRequest('POST', url);
      request.fields.addAll({
        'title': titleController.text,
        'note': noteController.text,
        'mood': selectedEmotion!,
        'user_id': "${profileController.userProfile?.id}",
      });

      request.files.add(await http.MultipartFile.fromPath('pic', image!.path));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print("Successful");
      } else {
        print("FAILED");
        print(response.reasonPhrase);
      }
    } catch (e) {}
  }
}
