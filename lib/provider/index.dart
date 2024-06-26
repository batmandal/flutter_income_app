import 'package:flutter/material.dart';
import 'package:flutter_income_app/global_keys.dart';
import 'package:flutter_income_app/models/income.dart';
import 'package:flutter_income_app/models/user.dart';
import 'package:flutter_income_app/repos/income.dart';
import 'package:flutter_income_app/repos/index.dart';
import 'package:flutter_income_app/repos/user.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider extends ChangeNotifier {
  StorableData<UserModel>? userRepo;
  StorableData<IncomeModel>? incomeRepo;
  List<IncomeModel> incomeList = [];

  DatabaseProvider() {
    init();
  }

  Future<void> fetchIncome() async {
    await DatabaseProvider.instance.init();
    incomeList = IncomeModel.fromList(await incomeRepo?.getAll() ?? []);
    notifyListeners();
  }

  Future<void> init() async {
    final database =
        await openDatabase("income.db", version: 1, onCreate: _onCreate);
    userRepo ??= UserRepo(db: database);
    incomeRepo ??= IncomeRepo(db: database);
    notifyListeners();
  }

  Future<void> _onCreate(Database db, int version) async {
    userRepo ??= UserRepo(db: db);
    userRepo?.createTable();
    incomeRepo ??= IncomeRepo(db: db);
    incomeRepo?.createTable();
  }

  static DatabaseProvider get instance =>
      Provider.of(GlobalKeys.navigatorKey.currentContext!, listen: false);
}
