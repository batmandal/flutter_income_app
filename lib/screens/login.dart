import 'package:flutter/material.dart';
import 'package:flutter_income_app/models/user.dart';
import 'package:flutter_income_app/provider/index.dart';
import 'package:flutter_income_app/screens/dashboard.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<String?> _onLogIn(LoginData data) async {
    final repo = DatabaseProvider.instance.userRepo;
    List<UserModel> users = UserModel.fromList(await repo?.getAll() ?? []);
    print(users);

    if (users.any((e) => e.email == data.name && e.password == data.password)) {
      return null;
    }
    return "invalid password or email";
  }

  Future<String?> _onSignUp(SignupData data) async {
    await DatabaseProvider.instance.init();
    final repo = DatabaseProvider.instance.userRepo;
    if (repo == null) {
      return "database tai holbogoj chadsangui";
    }
    List<UserModel> users = UserModel.fromList(await repo.getAll());
    print(users);

    if (users.any((e) => e.email == data.name)) {
      return "hereglegch burtgeltei bn";
    }
    await repo.addOne(UserModel(
        id: -1, email: data.name ?? '', password: data.password ?? ''));

    return null;
  }

  Future<String?> _onRecover(String data) async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Миний орлого',
      logo: const AssetImage('assets/Logo.png'),
      onLogin: _onLogIn,
      onSignup: _onSignUp,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const DashboardPage(),
        ));
      },
      onRecoverPassword: _onRecover,
      messages: LoginMessages(
        userHint: 'Цахим шуудан',
        passwordHint: 'Нууц үг',
        confirmPasswordHint: 'Баталгаажуулах',
        loginButton: 'Нэвтрэх',
        signupButton: 'Бүртгүүлэх',
        forgotPasswordButton: 'Нууц үг мартсан?',
        recoverPasswordButton: 'HELP ME',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Not match!',
        recoverPasswordDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
    );
  }
}
