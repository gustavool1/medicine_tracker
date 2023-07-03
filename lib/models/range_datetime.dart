class RangeDateTime {
  final DateTime? start;
  final DateTime? end;

  RangeDateTime({this.start, this.end});

  RangeDateTime copyWith({
    DateTime? start,
    DateTime? end,
  }) {
    return RangeDateTime(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}
