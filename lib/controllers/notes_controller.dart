import 'package:diary/models/all_notes.dart';
import 'package:diary/routes/routes.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:diary/utils/preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotesController extends GetxController {
  List<AllNotes>? allNotes;
  Preferences preferences = Preferences();

  var notes = <AllNotes>[].obs;

  void processFetchNotes() async {
    Get.showOverlay(
        asyncFunction: () => fetchNotes(), loadingWidget: const Loading());
    Get.toNamed(Routes.allNotes);
  }

  Future<void> fetchNotes() async {
    Map token = await preferences.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'encoding': 'utf-8',
        'Authorization': 'Bearer ${token['access']}'
      };

      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.allNotes);

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        allNotes = allNotesFromJson(response.body);
        notes.value = allNotesFromJson(response.body);
      } else {
        print("FaILED: ${response.body}");
      }
    } catch (e) {
      String output = "FAILED: $e";
    }
  }
}
