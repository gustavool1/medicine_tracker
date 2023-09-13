import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicine_tracker/api/api.dart';
import 'package:medicine_tracker/helpers/extensions.dart';

import '../models/medicine.dart';

class MedicineRepository {
  final _apiServices = ApiServices();

  Future<Medicine> createMedicine(Medicine medicine) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'USER-TOKEN');

    final response = await _apiServices.api.post(
      'medicines',
      data: {
        'name': medicine.name,
        'frequency': medicine.pillsAmount,
        'until': medicine.endTakingPill.toString(),
        'reminders': medicine.reminders
            ?.map((reminder) => reminder?.toHoursMinutes)
            .toList(),
        'from': medicine.startTakingPill.toString(),
      },
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    return Medicine.fromJson(response.data);
  }

  Future<List<Medicine>> getUserMedicines(String token) async {
    try {
      final response = await _apiServices.api.get('medicines',
          options: Options(headers: {"Authorization": "Bearer $token"}));

      final List<Medicine> medicines = (response.data as List<dynamic>)
          .map((pill) => Medicine.fromJson(pill))
          .toList();

      return medicines;
    } catch (e) {
      throw Exception();
    }
  }
}
