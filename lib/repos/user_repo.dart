import 'package:ARGUS/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:ARGUS/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  Future<bool> login(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();

      User user = User.fromJson(response.body);
      prefs.setString("user", user.toJson());
    }

    return (response.statusCode == 200);
  }

  Future<bool> register(String name, String email, String password) async {
    http.Response response = await http.post(
      Uri.parse("$baseUrl/register"),
      body: {
        "username": name,
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();

      User user = User.fromJson(response.body);
      prefs.setString("user", user.toJson());
    }

    return (response.statusCode == 200);
  }
}
