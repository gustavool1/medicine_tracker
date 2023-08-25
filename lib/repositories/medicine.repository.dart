import 'package:dio/dio.dart';
import 'package:medicine_tracker/api/api.dart';
import 'package:medicine_tracker/repositories/token.dart';

import '../models/create_pill_model.dart';

class MedicineRepository {
  final _apiServices = ApiServices();

  createMedicine(CreatePill medicine) async {
    await _apiServices.api.post('medicines',
        data: {
          'name': medicine.name,
          'frequency': medicine.pillsAmount,
          'until': medicine.endTakingPill.toString()
        },
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }
}
