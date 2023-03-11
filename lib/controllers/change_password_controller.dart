import 'package:diary/routes/routes.dart';
import 'package:diary/utils/preferences.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  Preferences preferences = Preferences();
  String? userId;

  TextEditingController password0 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field is required!';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }
    return null;
  }

  Future<void> changePassword() async {
    Map token = await preferences.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };

      var url = Uri.parse(APIEndPoints.baseURL +
          APIEndPoints.authEndPoints.changePassword +
          userId!);

      var request = http.MultipartRequest('PUT', url);

      request.fields.addAll({
        'password0': password0.text,
        'password1': password1.text,
        'password2': password2.text,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(
          "object: ${password0.text} \n ${password1.text} \n ${password2.text}");

      if (response.statusCode == 200) {
        String output = "Password Changed!";
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(output: output, isSuccess: true),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );

        Get.offNamed(Routes.home);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(
                output: response.reasonPhrase.toString(), isSuccess: false),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      }
    } catch (e) {
      String output = "FAILED: $e";
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: CustomSnackBar(output: output, isSuccess: false),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }
}
