class CalendarEvent {}

class CalendarEventOnSelectedDay extends CalendarEvent {
  final DateTime selectedDay;
  CalendarEventOnSelectedDay(this.selectedDay);
}

class CalendarEventChangeOpen extends CalendarEvent {}
