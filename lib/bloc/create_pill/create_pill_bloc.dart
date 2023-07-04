import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/models/models.dart';

import 'create_pill.dart';

class CreatePillBloc extends Bloc<CreatePillEvent, CreatePillState> {
  static CreatePill createPill = CreatePill();
  CreatePillBloc() : super(CreatePillState(createPill)) {
    on<CreatePillSetPillName>(_onCreatePillSetName);
  }

  _onCreatePillSetName(
      CreatePillSetPillName event, Emitter<CreatePillState> emit) {
    createPill.name = event.name;
    emit(CreatePillState(createPill));
  }
}
