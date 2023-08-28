import 'package:medicine_tracker/bloc/auth/models/sign_in.model.dart';

import '../api/api.dart';

class AuthRepository {
  final _apiServices = ApiServices();

  Future<String> signIn(SignInModel signInData) async {
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
}
