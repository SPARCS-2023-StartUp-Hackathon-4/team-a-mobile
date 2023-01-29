import 'package:bloc_practice/commons/constants.dart';
import 'package:bloc_practice/features/main/pages/program/bloc/program_bloc.dart';
import 'package:bloc_practice/features/main/pages/program/widgets/program_list_item.dart';
import 'package:bloc_practice/widgets/animated_shimmer_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgramList extends StatelessWidget {
  const ProgramList({required this.shimmer, Key? key}) : super(key: key);

  final bool shimmer;

  static Widget buildSkeleton() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 16,
              width: 100,
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                ...List.generate(
                  10,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: index == 10 - 1 ? 0 : 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: double.infinity,
                      height: 56,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProgramList(BuildContext context) {
    final filteredPrograms =
        context.read<ProgramBloc>().state.filteredProgramList;

    return Column(
      children: [
        ...List.generate(
          shimmer ? 10 : filteredPrograms.length,
          (index) => Padding(
            padding: EdgeInsets.only(
                bottom: index == (shimmer ? 10 : filteredPrograms.length) - 1
                    ? 0
                    : 12),
            child: AnimatedShimmerSwitcher(
              key: ValueKey(index),
              isShimmer: shimmer,
              skeletonChild: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
                width: double.infinity,
                height: 56,
              ),
              child: !shimmer
                  ? ProgramListItem(
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        print(filteredPrograms[index].url);
                        launchUrl(
                          Uri.parse(filteredPrograms[index].url),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      key: ValueKey(filteredPrograms[index].title),
                      title: filteredPrograms[index].title,
                      applyPeriod: filteredPrograms[index].applyPeriod,
                      category: filteredPrograms[index].category,
                      organization: filteredPrograms[index].organization,
                    )
                  : SizedBox(height: 56),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedShimmerSwitcher(
              isShimmer: shimmer,
              skeletonChild: Container(
                height: 16,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                context.read<ProgramBloc>().state.isSearching
                    ? "검색 결과"
                    : "추천 지원사업",
                style: const TextStyle(
                  fontSize: 16,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.6,
                ),
              ),
            ),
            const SizedBox(height: 12),
            buildProgramList(context),
          ],
        ),
      ),
    );
  }
}
