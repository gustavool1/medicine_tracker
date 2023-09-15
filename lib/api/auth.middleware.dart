import 'package:dio/dio.dart';
import 'package:medicine_tracker/repositories/auth.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends InterceptorsWrapper {
  AuthMiddleware();

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refresh-token');

      final AuthRepository authRepository = AuthRepository();

      String newAccessToken =
          await authRepository.refreshToken(refreshToken ?? '');
      await prefs.setString('token', newAccessToken);

      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      return handler.resolve(await Dio().fetch(err.requestOptions));
    }
    return handler.next(err);
  }
}
