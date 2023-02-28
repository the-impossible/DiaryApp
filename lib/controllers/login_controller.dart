import 'dart:convert';
import 'package:diary/controllers/profile_controller.dart';
import 'package:diary/controllers/tokenController.dart';
import 'package:diary/models/user_profile.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:diary/views/home.dart';
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

        usernameController.clear();
        passwordController.clear();
        Get.put(ProfileController());
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

  // getUserProfile() async {
  //   Get.showOverlay(
  //       asyncFunction: () => getProfile(), loadingWidget: const Loading());
  // }

  // Future<void> getProfile() async {
  //   Map token = await preferences.getToken();
  //   try {
  //     var headers = {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ${token['access']}'
  //     };
  //     var url =
  //         Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.profile);

  //     http.Response response = await http.get(url, headers: headers);
  //     ScaffoldMessenger.of(Get.context!).showSnackBar(
  //         SnackBar(
  //           content: CustomSnackBar(
  //               output: 'Unable to fetch profile', isSuccess: false),
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.transparent,
  //           elevation: 0,
  //         ),
  //       );
  //     if (response.statusCode == 200) {
  //       UserProfile userProfile = userProfileFromJson(response.body);

  //       Get.to(() => Home());
  //     } else {
  //       ScaffoldMessenger.of(Get.context!).showSnackBar(
  //         SnackBar(
  //           content: CustomSnackBar(
  //               output: 'Unable to fetch profile', isSuccess: false),
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.transparent,
  //           elevation: 0,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     String output = "FAILED: $e";
  //     ScaffoldMessenger.of(Get.context!).showSnackBar(
  //       SnackBar(
  //         content: CustomSnackBar(output: output, isSuccess: false),
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //       ),
  //     );
  //   }
  //   return null;
  // }
}
