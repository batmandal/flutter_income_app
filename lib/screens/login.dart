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
    return "invalid password";
  }

  Future<String?> _onSignUp(SignupData data) async {
    return "user already use";
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
