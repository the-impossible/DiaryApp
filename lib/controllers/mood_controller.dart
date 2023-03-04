import 'package:diary/models/all_mood.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MoodController extends GetxController {
  List<AllMoods>? allMood;

  var moods = <AllMoods>[].obs;

  Preferences preferences = Preferences();

  @override
  void onInit() {
    super.onInit();
    getMood();
  }

  Future<void> getMood() async {
    Map token = await preferences.getToken();

    try {
      var headers = {'Authorization': 'Bearer ${token['access']}'};

      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.allMoods);

      var request = http.Request('GET', url);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        moods.value = allMoodsFromJson(await response.stream.bytesToString());
      } else {}
    } catch (e) {
      String output = "FAILED: $e";
    }
  }
}
