import 'package:diary/models/all_mood.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:diary/utils/preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MoodController extends GetxController {
  List<AllMoods>? allMood;
  Preferences preferences = Preferences();

  @override
  void onInit() {
    super.onInit();
    getMood();
  }

  Future<void> getMood() async {
    Map token = await preferences.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };
      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.allMoods);

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        allMood = allMoodsFromJson(response.body);
        print(response.body);
      }
    } catch (e) {
      String output = "FAILED: $e";
    }
  }
}
