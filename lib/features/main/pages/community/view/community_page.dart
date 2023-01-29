import 'package:bloc_practice/features/community_repository/community_repository.dart';
import 'package:bloc_practice/features/main/pages/community/bloc/community_bloc.dart';
import 'package:bloc_practice/features/main/pages/community/view/community_success_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'commuity_failure_layout.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CommunityBloc(
            communityRepository:
                RepositoryProvider.of<CommunityRepository>(context));
      },
      child: BlocBuilder<CommunityBloc, CommunityState>(
        builder: (context, state) {
          if (state.status == CommunityPageStatus.initial) {
            context.read<CommunityBloc>().add(const CommunityLoadData());
          }
          if (state.status == CommunityPageStatus.failure) {
            return const CommunityFailureLayout();
          }

          return CommunitySuccessLayout(
            shimmer: state.status == CommunityPageStatus.loading,
          );
        },
      ),
    );
  }
}
