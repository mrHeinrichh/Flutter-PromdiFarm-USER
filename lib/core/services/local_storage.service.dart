import 'package:promdifarm_app/core/const/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final String _token = 'token';

  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(TOKEN);

    if (token == null) sharedPreferences.setString(TOKEN, "");
    return "Bearer " + (token ?? "");
  }

  Future<void> setToken({required String token}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_token, token);
  }
}
