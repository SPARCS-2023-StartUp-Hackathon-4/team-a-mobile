import 'package:bloc_practice/features/main/pages/community/widgets/community_articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../commons/constants.dart';

import '../bloc/community_bloc.dart';
import '../widgets/community_top_article.dart';

class CommunitySuccessLayout extends StatelessWidget {
  const CommunitySuccessLayout({required this.shimmer, Key? key})
      : super(key: key);

  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CommunityBloc>().add(const CommunityLoadData());
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: [
              const SizedBox(height: AppConstants.defaultPadding),
              CommunityTopArticle(shimmer: shimmer),
              const SizedBox(height: 36),
              CommunityArticles(shimmer: shimmer),
            ],
          ),
        ),
      ),
    );
  }
}
