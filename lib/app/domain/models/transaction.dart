class Transaction {
  final double amount;
  final DateTime date;
  final String description;
  final String id;
  final String title;

  Transaction({
    required this.amount,
    required this.date,
    required this.description,
    required this.id,
    required this.title,
  });
}
