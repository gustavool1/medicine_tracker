import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import 'calendar.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  static CalendarModel calendar = CalendarModel(selectedDate: DateTime.now());

  CalendarBloc() : super(CalendarState(calendar)) {
    on<CalendarEventOnSelectedDay>(_onSelectedDay);
    on<CalendarEventChangeOpen>(_onChangeOpen);
  }

  _onSelectedDay(
    CalendarEventOnSelectedDay event,
    Emitter<CalendarState> emit,
  ) {
    calendar.selectedDate = event.selectedDay;
    emit(CalendarState(calendar));
  }

  _onChangeOpen(CalendarEventChangeOpen event, Emitter<CalendarState> emit) {
    calendar.isOpen = !calendar.isOpen;
    emit(CalendarState(calendar));
  }
}
