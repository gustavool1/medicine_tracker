import 'package:medicine_tracker/bloc/auth/models/auth_info.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  Future<String> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return token ?? '';
  }

  Future<String> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refresh-token');

    return refreshToken ?? '';
  }

  Future<void> setTokenOnPreferences(String newToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', newToken);
  }

  Future<void> setRefreshTokenOnPreferences(String newToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh-token', newToken);
  }

  Future<AuthInfo> initializeAuthInfo() async {
    return AuthInfo(
      accessToken: await getUserToken(),
      refreshToken: await getRefreshToken(),
    );
  }
}
