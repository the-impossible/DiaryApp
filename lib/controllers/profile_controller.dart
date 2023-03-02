import 'package:diary/models/user_profile.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:diary/utils/preferences.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:diary/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'mood_controller.dart';

class ProfileController extends GetxController {
  Preferences preferences = Preferences();

  UserProfile? userProfile;

  @override
  void onInit() {
    super.onInit();
    Get.showOverlay(
        asyncFunction: () => getProfile(), loadingWidget: const Loading());
  }

  var isLoading = false.obs;

  Future<void> getProfile() async {
    Map token = await preferences.getToken();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };
      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.profile);

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        userProfile = userProfileFromJson(response.body);

        isLoading(true);
        Get.to(() => Home());
        Get.put(MoodController());
        
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CustomSnackBar(
                output: 'Unable to fetch profile', isSuccess: false),
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
    } finally {
      isLoading(false);
    }
  }
}
