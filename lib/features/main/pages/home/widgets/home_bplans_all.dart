import 'package:bloc_practice/features/bplan_viewer/view/bplan_viewer_page.dart';
import 'package:bloc_practice/features/main/pages/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/main/pages/home/widgets/home_bplan_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../commons/constants.dart';
import '../../../../../widgets/animated_shimmer_switcher.dart';

class HomeBPlansAll extends StatelessWidget {
  const HomeBPlansAll({required this.shimmer, Key? key}) : super(key: key);

  final bool shimmer;

  static Widget buildSkeleton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              width: 100,
              height: 16,
            ),
            const SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              width: double.infinity,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBPlansAllColumn(BuildContext context) {
    final recentBPlans = context.read<HomeBloc>().state.bPlanList;

    return Column(
      children: [
        ...List.generate(
          recentBPlans.length,
          (index) => Padding(
            padding: EdgeInsets.only(
                bottom: index == recentBPlans.length - 1 ? 0 : 12),
            child: HomeBPlanListItem(
              key: ValueKey(recentBPlans[index].title),
              onTap: () {
                Navigator.push(context, BPlanViewerPage.route());
              },
              title: recentBPlans[index].title,
              thumbnailUrl:
                  "https://www.smartsheet.com/sites/default/files/2022-05/IC-Simple-Gantt-Chart-Project-Plan.png",
              lastModified: 0,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedShimmerSwitcher(
      isShimmer: shimmer,
      skeletonChild: buildSkeleton(),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "모든 사업계획서",
                style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  letterSpacing: -0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              buildBPlansAllColumn(context),
            ],
          ),
        ),
      ),
    );
  }
}
