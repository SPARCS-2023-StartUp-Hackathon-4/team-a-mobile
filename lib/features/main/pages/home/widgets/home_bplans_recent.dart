import 'package:bloc_practice/features/bplan_viewer/view/bplan_viewer_page.dart';
import 'package:bloc_practice/features/main/pages/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/main/pages/home/widgets/home_bplan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../commons/constants.dart';
import '../../../../../widgets/animated_shimmer_switcher.dart';

class HomeBPlansRecent extends StatelessWidget {
  const HomeBPlansRecent({required this.shimmer, Key? key}) : super(key: key);

  final bool shimmer;

  static Widget buildSkeleton() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              width: 100,
              height: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
              vertical: 14,
            ),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.circular(AppConstants.defaultBorderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBPlansRecentRow(BuildContext context) {
    final recentBPlans = context.read<HomeBloc>().state.bPlanList;

    return Row(
      children: [
        ...List.generate(
          recentBPlans.length,
          (index) => Padding(
            padding: EdgeInsets.only(
                right: index == recentBPlans.length - 1 ? 0 : 12),
            child: HomeBPlanCard(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
              child: Text(
                "최근 사업계획서",
                style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  letterSpacing: -0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: 14,
              ),
              scrollDirection: Axis.horizontal,
              child: buildBPlansRecentRow(context),
            ),
          ],
        ),
      ),
    );
  }
}
