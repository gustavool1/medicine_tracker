import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicine_tracker/api/api.dart';

import '../models/create_pill_model.dart';

class MedicineRepository {
  final _apiServices = ApiServices();

  createMedicine(CreatePill medicine) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'USER-TOKEN');

    await _apiServices.api.post('medicines',
        data: {
          'name': medicine.name,
          'frequency': medicine.pillsAmount,
          'until': medicine.endTakingPill.toString()
        },
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }
}
