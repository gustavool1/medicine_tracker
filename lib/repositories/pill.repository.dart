import 'package:dio/dio.dart';
import 'package:medicine_tracker/repositories/token.dart';

import '../api/api.dart';
import '../models/models.dart';

class PillRepository {
  final _apiServices = ApiServices();

  Future<List<PillModel>> getPillsByDay(String date) async {
    final response = await _apiServices.api.get('pill/byDay/$date',
        options: Options(headers: {"Authorization": "Bearer $token"}));

    final List<PillModel> pills = (response.data as List<dynamic>)
        .map((pill) => PillModel.fromMap(pill))
        .toList();

    return pills;
  }

  Future<bool> takePill(String pillId) async {
    final response = await _apiServices.api.get('pill/takePill/$pillId',
        options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
