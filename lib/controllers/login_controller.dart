import 'dart:convert';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> createAccount() async {
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
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const SimpleDialog(
                title: Text("Successful"),
                children: [Text("Registration Successful, you can now login")],
              );
            });
        usernameController.clear();
        passwordController.clear();
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Failed"),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
