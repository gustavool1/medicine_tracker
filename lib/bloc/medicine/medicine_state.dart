import '../../models/models.dart';

class MedicineState {
  final Medicine medicine;
  MedicineState(this.medicine);
}

class MedicineGottenSuccessfully extends MedicineState {
  @override
  // ignore: overridden_fields
  final Medicine medicine;
  final List<Medicine> medicines;

  MedicineGottenSuccessfully(this.medicine, this.medicines) : super(medicine);
}
