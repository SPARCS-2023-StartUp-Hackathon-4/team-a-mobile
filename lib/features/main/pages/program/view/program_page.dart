import 'package:bloc_practice/features/main/pages/program/view/program_failure_layout.dart';
import 'package:bloc_practice/features/main/pages/program/view/program_success_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../program_repository/program_repository.dart';
import '../bloc/program_bloc.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProgramBloc(
            programRepository:
                RepositoryProvider.of<ProgramRepository>(context));
      },
      child: BlocBuilder<ProgramBloc, ProgramState>(
        builder: (context, state) {
          if (state.status == ProgramPageStatus.initial) {
            context.read<ProgramBloc>().add(const ProgramLoadData());
          }
          if (state.status == ProgramPageStatus.failure) {
            return const ProgramFailureLayout();
          }

          return ProgramSuccessLayout(
            shimmer: state.status == ProgramPageStatus.loading,
          );
        },
      ),
    );
  }
}
