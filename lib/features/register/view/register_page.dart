import 'package:bloc_practice/features/authentication_repository/authentication_repository.dart';
import 'package:bloc_practice/features/register/bloc/register_bloc.dart';
import 'package:bloc_practice/features/register/view/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("register")),
      body: BlocProvider(
        create: (context) => RegisterBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context)),
        child: const RegisterForm(),
      ),
    );
  }
}
