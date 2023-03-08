import 'dart:convert';
import 'package:diary/controllers/profile_controller.dart';
import 'package:diary/controllers/tokenController.dart';
import 'package:diary/models/user_profile.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diary/utils/preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserProfile? userProfile;
  Preferences preferences = Preferences();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required!';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is Required!';
    }
    return null;
  }

  verifyLogin() async {
    Get.showOverlay(
        asyncFunction: () => signIn(), loadingWidget: const Loading());
  }

  Future<void> signIn() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.signIn);

      Map body = {
        'username': usernameController.text,
        'password': passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        TokenController tokenController =
            tokenControllerFromJson(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('refresh', tokenController.refresh);
        await prefs.setString('access', tokenController.access);
        Get.put(ProfileController());
        usernameController.clear();
        passwordController.clear();
      } else {
        String result = jsonDecode(response.body)['detail'];
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(output: result, isSuccess: false),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: CustomSnackBar(output: "FAILED: $e", isSuccess: false),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }
}
