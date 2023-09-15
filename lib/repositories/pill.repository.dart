import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/helpers/auth.helper.dart';
import 'package:medicine_tracker/helpers/extensions.dart';

import '../api/api.dart';
import '../models/models.dart';

class PillRepository {
  final _apiServices = ApiServices();
  final _authHelper = AuthHelper();

  Future<List<PillModel>> getPillsByDay(String date) async {
    final token = await _authHelper.getUserToken();
    final response = await _apiServices.api.get('pill/byDay/$date',
        options: Options(headers: {"Authorization": "Bearer $token"}));

    final List<PillModel> pills = (response.data as List<dynamic>)
        .map((pill) => PillModel.fromMap(pill))
        .toList();

    return pills;
  }

  Future<bool> takePill(int pillId) async {
    final token = await _authHelper.getUserToken();

    final response = await _apiServices.api.get('pill/takePill/$pillId',
        options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> changeReminder(int pillId, TimeOfDay timeOfDay) async {
    final token = await _authHelper.getUserToken();

    final response = await _apiServices.api.patch('pill/changeReminder/$pillId',
        data: {'id': pillId, 'time': timeOfDay.toHoursMinutes},
        options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<PillModel> getPillById(int pillId) async {
    final token = await _authHelper.getUserToken();

    final response = await _apiServices.api.get('pill/$pillId',
        options: Options(headers: {"Authorization": "Bearer $token"}));
    return PillModel.fromMap(response.data as Map<String, dynamic>);
  }
}
