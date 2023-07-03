import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import 'calendar.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  static RangeDateTime rangeDateTime = RangeDateTime();

  CalendarBloc() : super(CalendarState(rangeDateTime)) {
    on<CalendarEventOnSelectedDayStart>(_onSelectedStartDay);
    on<CalendarEventOnSelectedDayEnd>(_onSelectedEndDay);
  }

  _onSelectedStartDay(
      CalendarEventOnSelectedDayStart event, Emitter<CalendarState> emit) {
    rangeDateTime = RangeDateTime(start: event.selectedDay);
    emit(CalendarState(rangeDateTime));
  }

  _onSelectedEndDay(
      CalendarEventOnSelectedDayEnd event, Emitter<CalendarState> emit) {
    rangeDateTime = rangeDateTime.copyWith(end: event.selectedDay);
    emit(CalendarState(rangeDateTime));
  }
}
