import 'package:medicine_tracker/bloc/auth/models/user_data.model.dart';

import '../api/api.dart';
import '../bloc/auth/models/auth_info.model.dart';

class AuthRepository {
  final _apiServices = ApiServices();

  Future<AuthInfo> signIn(UserDataModel signInData) async {
    try {
      final response = await _apiServices.api.post(
        'users/signIn',
        data: signInData.toJson(),
      );
      return AuthInfo.fromJson(response.data);
    } catch (_) {
      throw Exception();
    }
  }

  Future<void> register(UserDataModel registerData) async {
    try {
      await _apiServices.api.post(
        'users',
        data: {...registerData.toJson()},
      );
    } catch (_) {
      throw Exception();
    }
  }

  Future<String> refreshToken(String refreshToken) async {
    try {
      final response = await _apiServices.api.get(
        'users/$refreshToken',
      );
      return response.data['accessToken'];
    } catch (_) {
      throw Exception();
    }
  }
}
