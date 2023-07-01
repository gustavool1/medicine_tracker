class Pill {
  final String timeToTake;
  final String name;
  final int amount;
  final bool done;

  Pill({
    required this.timeToTake,
    required this.name,
    required this.amount,
    this.done = false,
  });

  String get amountLabel {
    if (amount > 1) {
      return '$amount Pilulas';
    }
    return '$amount Pilula';
  }
}
