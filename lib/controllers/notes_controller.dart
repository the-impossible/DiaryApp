import 'package:diary/models/all_notes.dart';
import 'package:diary/routes/routes.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:diary/utils/preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotesController extends GetxController {
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
        'Authorization': 'Bearer ${token['access']}'
      };

      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.allNotes);

      var request = http.Request('GET', url);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        notes.value = allNotesFromJson(await response.stream.bytesToString());
      } else {
        print("FaILED: ${response.reasonPhrase}");
      }
    } catch (e) {
      String output = "FAILED: $e";
    }
  }
}
