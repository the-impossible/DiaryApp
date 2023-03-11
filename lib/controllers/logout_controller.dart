import 'package:diary/routes/routes.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diary/utils/preferences.dart';
import 'package:http/http.dart' as http;

class LogoutController extends GetxController {
  Preferences preferences = Preferences();

  verifyLogin() async {
    Get.showOverlay(
        asyncFunction: () => signOut(), loadingWidget: const Loading());
  }

  Future<void> signOut() async {
    Map token = await preferences.getToken();
    try {
      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.signOut);

      var request = http.MultipartRequest('POST', url);

      request.fields.addAll(
        {'refresh': token['refresh']},
      );

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.clear();
        print("object");
        Get.offNamed(Routes.signIn);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(
                output: "${response.reasonPhrase}", isSuccess: false),
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
