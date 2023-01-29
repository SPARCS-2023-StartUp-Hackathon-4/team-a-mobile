import 'package:bloc_practice/commons/constants.dart';
import 'package:bloc_practice/features/main/pages/program/bloc/program_bloc.dart';
import 'package:bloc_practice/features/main/pages/program/widgets/program_list.dart';
import 'package:bloc_practice/widgets/flit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgramSuccessLayout extends StatelessWidget {
  const ProgramSuccessLayout({required this.shimmer, Key? key})
      : super(key: key);

  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProgramBloc>().add(const ProgramLoadData());
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: [
              const SizedBox(height: AppConstants.defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding),
                child: FlitTextField(
                  hintText: '검색어 입력',
                  prefixIcon: const Icon(Icons.search),
                  onChanged: (value) {
                    context
                        .read<ProgramBloc>()
                        .add(ProgramSearchTextChanged(value));
                  },
                ),
              ),
              const SizedBox(height: 36),
              ProgramList(shimmer: shimmer),
            ],
          ),
        ),
      ),
    );
  }
}
