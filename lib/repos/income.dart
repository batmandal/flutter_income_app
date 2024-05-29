import 'package:flutter_income_app/models/user.dart';
import 'package:flutter_income_app/repos/index.dart';

class IncomeRepo extends StorableData<UserModel> {
  IncomeRepo({required super.db, super.tableName = "Income"});

  @override
  String get insertOneQuery => '''
      INSERT INTO $tableName(isIncome, amount, description)
      VALUES(?, ?, ?)
      ''';

  @override
  String get strCreateTable => '''
  CREATE TABLE $tableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    isIncome BOOLEAN NOT NULL
    amount TEXT NOT NULL,
    description TEXT NOT NULL)
  ''';

  @override
  String get updateOneQuery => '''
 UPDATE $tableName SET
 isIncome = ? 
 amount = ?
 description = ?
 WHERE id = ?
 ''';
}
