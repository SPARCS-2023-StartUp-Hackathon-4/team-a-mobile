import 'package:bloc_practice/commons/constants.dart';
import 'package:bloc_practice/features/main/pages/community/bloc/community_bloc.dart';
import 'package:bloc_practice/features/main/pages/community/widgets/community_article_card.dart';
import 'package:bloc_practice/features/main/pages/community/widgets/community_top_article_item.dart';
import 'package:bloc_practice/widgets/animated_shimmer_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityTopArticle extends StatelessWidget {
  const CommunityTopArticle({required this.shimmer, Key? key})
      : super(key: key);

  final bool shimmer;

  static Widget buildSkeleton() {
    return Column(
      children: [],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedShimmerSwitcher(
      isShimmer: shimmer,
      skeletonChild: buildSkeleton(),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "🔥",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'tossface',
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "지금 인기있는 게시글",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...context.read<CommunityBloc>().state.topArticleList.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CommunityTopArticleItem(
                      key: ValueKey(e.id),
                      index: context
                          .read<CommunityBloc>()
                          .state
                          .topArticleList
                          .indexOf(e),
                      article: e,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
