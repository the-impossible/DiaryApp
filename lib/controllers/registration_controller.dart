import 'dart:convert';
import 'package:diary/pages/sign_in.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is Required!';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required!';
    } else if (passwordController.text.length < 6) {
      return 'Password should be at least 6 characters!';
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

  Future<void> createAccount() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.signUp);
      Map body = {
        'name': nameController.text,
        'username': usernameController.text,
        'password': passwordController.text,
        'email': emailController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        String output = "Registration Successful, you can now login";
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(output: output, isSuccess: true),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        nameController.clear();
        usernameController.clear();
        emailController.clear();
        passwordController.clear();
        Get.off(() => const SignIn());
      } else {
        Map result = jsonDecode(response.body);
        String output = "";
        result.forEach((key, value) => output += "${value[0]}\n");
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(output: output, isSuccess: false),
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
