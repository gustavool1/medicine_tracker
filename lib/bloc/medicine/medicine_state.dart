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

class MedicineLoading extends MedicineState {
  MedicineLoading() : super(Medicine());
}

class MedicineDeletedSuccessfully extends MedicineState {
  @override
  // ignore: overridden_fields
  final Medicine medicine;
  final List<Medicine> medicines;

  MedicineDeletedSuccessfully(this.medicine, this.medicines) : super(medicine);
}

class MedicineEmpty extends MedicineState {
  MedicineEmpty() : super(Medicine());
}
