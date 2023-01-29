import 'package:bloc_practice/commons/constants.dart';
import 'package:bloc_practice/features/main/pages/home/widgets/home_bplans_recent.dart';
import 'package:bloc_practice/features/main/pages/home/widgets/home_indication.dart';
import 'package:bloc_practice/features/main/pages/home/widgets/home_introduction.dart';
import 'package:bloc_practice/features/main/pages/home/widgets/home_bplans_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeSuccessLayout extends StatelessWidget {
  const HomeSuccessLayout({required this.shimmer, Key? key}) : super(key: key);

  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(const HomeLoadData());
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: AppConstants.defaultPadding),
            HomeIntroduction(
              shimmer: shimmer,
            ),
            const SizedBox(height: 38),
            HomeIndication(shimmer: shimmer),
            const SizedBox(height: 34),
            HomeBPlansRecent(shimmer: shimmer),
            const SizedBox(height: 34),
            HomeBPlansAll(shimmer: shimmer),
          ],
        ),
      ),
    );
  }
}
