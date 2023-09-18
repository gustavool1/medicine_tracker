import 'package:dio/dio.dart';
import 'package:medicine_tracker/api/api.dart';

import '../helpers/helper.dart';
import '../models/medicine.dart';

class MedicineRepository {
  final _apiServices = ApiServices();
  final _authHelper = AuthHelper();

  Future<Medicine> createMedicine(Medicine medicine) async {
    final token = _authHelper.getUserToken();

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

  Future<bool> deleteMedicine(String id, String token) async {
    final response = await _apiServices.api.get('medicines/$id',
        options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == 200) return true;
    return false;
  }
}
