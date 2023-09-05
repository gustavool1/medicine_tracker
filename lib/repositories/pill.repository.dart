import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/api.dart';
import '../models/models.dart';

class PillRepository {
  final _apiServices = ApiServices();

  Future<List<PillModel>> getPillsByDay(String date) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'USER-TOKEN');

    final response = await _apiServices.api.get('pill/byDay/$date',
        options: Options(headers: {"Authorization": "Bearer $token"}));

    final List<PillModel> pills = (response.data as List<dynamic>)
        .map((pill) => PillModel.fromMap(pill))
        .toList();

    return pills;
  }

  Future<bool> takePill(int pillId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'USER-TOKEN');

    final response = await _apiServices.api.get('pill/takePill/$pillId',
        options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<PillModel> getPillById(int pillId) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'USER-TOKEN');

    final response = await _apiServices.api.get('pill/$pillId',
        options: Options(headers: {"Authorization": "Bearer $token"}));
    return PillModel.fromMap(response.data as Map<String, dynamic>);
  }
}
