import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AnimatedShimmerSwitcher extends StatelessWidget {
  const AnimatedShimmerSwitcher(
      {required this.isShimmer,
      required this.child,
      required this.skeletonChild,
      Key? key})
      : super(key: key);

  final bool isShimmer;

  final Widget child;

  final Widget skeletonChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: const ValueKey("animated_shimmer_switcher"),
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
      child: isShimmer
          ? SizedBox(
              key: const ValueKey("skeleton"),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: skeletonChild,
              ),
            )
          : SizedBox(
              key: const ValueKey("non_skeleton"),
              child: child,
            ),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            alignment: Alignment.topCenter,
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(animation),
            child: child,
          ),
        );
      },
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
        return Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
    );
  }
}
