class CalendarEvent {}

class CalendarEventOnSelectedDayStart extends CalendarEvent {
  final DateTime selectedDay;
  CalendarEventOnSelectedDayStart(this.selectedDay);
}

class CalendarEventOnSelectedDayEnd extends CalendarEvent {
  final DateTime selectedDay;
  CalendarEventOnSelectedDayEnd(this.selectedDay);
}
