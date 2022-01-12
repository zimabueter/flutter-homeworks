class Expense {
  int? id;
  String? title;
  num? expenseAmount;
  DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.expenseAmount,
    required this.date,
  });

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        id: json["id"],
        title: json["expenseTitle"],
        expenseAmount: json["amount"],
        date: DateTime.parse(json["date"]),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "expenseTitle": title,
        "amount": expenseAmount,
        "date": date.toIso8601String(),
      };
}
