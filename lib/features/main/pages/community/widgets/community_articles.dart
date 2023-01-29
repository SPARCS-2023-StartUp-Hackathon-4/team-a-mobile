import 'package:bloc_practice/app.dart';
import 'package:bloc_practice/commons/constants.dart';
import 'package:bloc_practice/features/main/pages/community/bloc/community_bloc.dart';
import 'package:bloc_practice/features/main/pages/community/widgets/community_article_card.dart';
import 'package:bloc_practice/features/main/pages/community/widgets/community_tab_bar.dart';
import 'package:bloc_practice/features/main/pages/community/widgets/community_top_article_item.dart';
import 'package:bloc_practice/widgets/animated_shimmer_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityArticles extends StatelessWidget {
  const CommunityArticles({required this.shimmer, Key? key}) : super(key: key);

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "☘",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'tossface',
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "전체 게시물 탐색",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: AppConstants.defaultPadding),
                  child: CommunityTabBar(
                    onTabChanged: (index) {
                      context.read<CommunityBloc>().add(
                        CommunityFilterCategoryChanged(() {
                          switch (index) {
                            case 0:
                              return "";
                            case 1:
                              return "news";
                            case 2:
                              return "material";
                            case 3:
                              return "blog";
                            default:
                              return "";
                          }
                        }()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                  ),
                  child: Column(
                    children: context
                        .read<CommunityBloc>()
                        .state
                        .filteredArticleList
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: CommunityArticleCard(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return Material(
                                      child: CommunityArticleCard(
                                        article: e,
                                      ),
                                    );
                                  },
                                );
                              },
                              key: ValueKey(e.id),
                              article: e,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
