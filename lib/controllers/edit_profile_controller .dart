import 'dart:io';
import 'package:diary/controllers/profile_controller.dart';
import 'package:diary/routes/routes.dart';
import 'package:diary/utils/preferences.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditProfileController extends GetxController {
  Preferences preferences = Preferences();
  String? userId;
  File? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is Required!';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is Required!';
    } else if (phoneController.text.length != 11) {
      return 'Phone Number should be at exactly 11 characters!';
    }
    return null;
  }

  String? validateEmail(String? value) {
    bool emailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value!);
    if (value.isEmpty) {
      return 'Email is Required!';
    } else if (!emailValid) {
      return 'Valid Email is Required!';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is Required!';
    } else if (usernameController.text.length < 6) {
      return 'Username should be at least 6 characters!';
    }
    return null;
  }

  Future<void> updateAccount() async {
    Map token = await preferences.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.editUser + userId!);

      var request = http.MultipartRequest('PUT', url);

      request.fields.addAll({
        'name': nameController.text,
        'username': usernameController.text,
        'phone': phoneController.text,
        'email': emailController.text
      });

      if (image?.path != null) {
        request.files
            .add(await http.MultipartFile.fromPath('pic', image!.path));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String output = "Profile Updated Successfully";
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(output: output, isSuccess: true),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );

        ProfileController profileController = Get.put(ProfileController());
        profileController.getProfile();

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
