import 'package:medicine_tracker/bloc/auth/models/user_data.model.dart';

import '../api/api.dart';

class AuthRepository {
  final _apiServices = ApiServices();

  Future<String> signIn(UserDataModel signInData) async {
    try {
      final response = await _apiServices.api.post(
        'users/signIn',
        data: signInData.toJson(),
      );
      return response.data['accessToken'];
    } catch (_) {
      throw Exception();
    }
  }

  Future<dynamic> register(UserDataModel registerData) async {
    try {
      await _apiServices.api.post(
        'users',
        data: {...registerData.toJson()},
      );
    } catch (_) {
      throw Exception();
    }
  }
}
