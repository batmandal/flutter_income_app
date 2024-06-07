import 'package:flutter_income_app/models/user.dart';
import 'package:flutter_income_app/repos/index.dart';

class UserRepo extends StorableData<UserModel> {
  UserRepo({required super.db, super.tableName = "User"});

  @override
  String get insertOneQuery => '''
    INSERT INTO $tableName(email, password)
    VALUES(?, ?)
  ''';

  @override
  String get strCreateTable => '''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL)
  ''';

  @override
  String get updateOneQuery => '''
  UPDATE $tableName SET
    email = ?
    password = ?
    WHERE id = ?
  ''';
}
