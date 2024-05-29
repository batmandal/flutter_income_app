import 'package:flutter_income_app/models/index.dart';

class IncomeModel extends StorableModel {
  bool isIncome;
  String amount, description;

  IncomeModel(
      {required super.id,
      required this.isIncome,
      required this.amount,
      required this.description});

  @override
  List<Object?> get queryList => [isIncome, amount, description];
}
