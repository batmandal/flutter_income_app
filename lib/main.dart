import 'package:flutter/material.dart';
import 'package:flutter_income_app/global_keys.dart';
import 'package:flutter_income_app/provider/index.dart';
import 'package:flutter_income_app/screens/login.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => DatabaseProvider())],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          navigatorKey: GlobalKeys.navigatorKey,
          home: const LoginScreen(),
        ));
  }

  Widget content() {
    return const Center(
      child: Text("hi"),
    );
  }
}
