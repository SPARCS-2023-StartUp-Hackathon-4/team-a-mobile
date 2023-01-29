import 'package:bloc_practice/commons/constants.dart';
import 'package:bloc_practice/features/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/bloc/authentication_bloc.dart';
import '../../authentication_repository/authentication_repository.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  Widget buildUserLogo() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      alignment: Alignment.center,
      child: const Text(
        "G",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget buildUserName() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) => Text(
        state.status == AuthenticationStatus.authenticated
            ? '${state.user.username}의 공간'
            : '로그인이 필요합니다',
        style: const TextStyle(
          fontSize: 16,
          letterSpacing: 0.2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildMYButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
      },
      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "MY",
          style: TextStyle(
            letterSpacing: -0.8,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Material(
        // elevation: 1,
        shadowColor: Colors.black.withOpacity(0.25),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildUserLogo(),
              const SizedBox(width: 14),
              buildUserName(),
              Expanded(child: Container()),
              buildMYButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
