class PillModel {
  final String id;
  final String timeToTake;
  final String name;
  final int amount;
  bool isTakeit;

  PillModel({
    required this.id,
    required this.timeToTake,
    required this.name,
    required this.amount,
    this.isTakeit = false,
  });

  void takePill() {
    isTakeit = true;
  }

  String get amountLabel {
    if (amount > 1) {
      return '$amount Pilulas';
    }
    return '$amount Pilula';
  }
}
