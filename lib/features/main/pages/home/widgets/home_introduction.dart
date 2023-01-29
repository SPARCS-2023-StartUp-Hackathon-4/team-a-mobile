import 'package:bloc_practice/commons/constants.dart';
import 'package:bloc_practice/widgets/animated_shimmer_switcher.dart';
import 'package:flutter/material.dart';

class HomeIntroduction extends StatelessWidget {
  const HomeIntroduction({required this.shimmer, Key? key}) : super(key: key);

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
            SizedBox(
              height: 32,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: 180,
                  height: 26,
                ),
              ),
            ),
            SizedBox(
              height: 32,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: 240,
                  height: 26,
                ),
              ),
            ),
          ],
        ),
      ),
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
              Text(
                "오늘의 플릿컴퍼니\n" +
                    "${DateTime.now().month}월 ${DateTime.now().day}일의 소식입니다.",
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 0.2,
                  height: 32 / 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
