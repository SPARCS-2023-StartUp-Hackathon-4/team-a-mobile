import 'package:bloc_practice/features/bplan_repository/bplan_repository.dart';
import 'package:bloc_practice/features/main/pages/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/main/pages/home/view/home_failure_layout.dart';
import 'package:bloc_practice/features/main/pages/home/view/home_success_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final successKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc(
            bPlanRepository: RepositoryProvider.of<BPlanRepository>(context));
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomePageStatus.initial) {
            context.read<HomeBloc>().add(const HomeLoadData());
          }
          if (state.status == HomePageStatus.failure) {
            return const HomeFailureLayout();
          }

          return HomeSuccessLayout(
            key: successKey,
            shimmer: state.status == HomePageStatus.loading,
          );
        },
      ),
    );
  }
}
