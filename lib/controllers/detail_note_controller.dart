import 'package:diary/models/detail_note.dart';
import 'package:diary/routes/routes.dart';
import 'package:diary/utils/endpoints.dart';
import 'package:diary/utils/loading.dart';
import 'package:diary/utils/preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailNoteController extends GetxController {
  Preferences preferences = Preferences();
  // var note = <DetailNote>{}.obs;
  DetailNote? note;
  String? note_id;

  void processFetchNote(String route) async {
    Get.showOverlay(
        asyncFunction: () => fetchNote(route), loadingWidget: const Loading());
  }

  Future<void> fetchNote(String route) async {
    Map token = await preferences.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };

      var url = Uri.parse(APIEndPoints.baseURL +
          APIEndPoints.authEndPoints.detailNote +
          note_id!);

      var request = http.Request('GET', url);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        note = detailNoteFromJson(await response.stream.bytesToString());
        if (route == 'details') Get.toNamed(Routes.detailNote);
        if (route == 'edit') Get.toNamed(Routes.editNote);
      } else {
        print("FaILED: ${response.reasonPhrase}");
      }
    } catch (e) {
      String output = "FAILED: $e";
    }
  }
}
