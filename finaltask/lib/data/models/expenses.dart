class Expense {
  String? id;
  final int? docId;
  final String? title;
  final double? expenseAmount;
  final String date;

  Expense({
    required this.docId,
    required this.title,
    required this.expenseAmount,
    required this.date,
  });
}
