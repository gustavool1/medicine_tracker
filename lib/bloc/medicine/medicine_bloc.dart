import 'package:flutter_bloc/flutter_bloc.dart';

import 'medicine.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(MedicineState()) {}
}
