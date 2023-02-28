import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<Map> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map token = {
      'access': prefs.getString('access'),
      'refresh': prefs.getString('refresh'),
    };
    return token;
  }
}
