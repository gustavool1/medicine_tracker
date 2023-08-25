import 'package:dio/dio.dart';

class ApiServices {
  final api = Dio();

  ApiServices({String? apiBaseURL}) {
    api.options.baseUrl = apiBaseURL ?? 'http://10.0.2.2:3000/';
    api.options.followRedirects = false;
    api.options.validateStatus = (status) => status! <= 201;
    api.options.headers.clear();
    api.options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
  }
}
