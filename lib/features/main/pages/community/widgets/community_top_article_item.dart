import 'dart:math';

import 'package:bloc_practice/features/community_repository/models/article.dart';
import 'package:flutter/material.dart';

import 'community_article_card.dart';

class CommunityTopArticleItem extends StatelessWidget {
  const CommunityTopArticleItem({
    required this.index,
    required this.article,
    Key? key,
  }) : super(key: key);

  final Article article;
  final int index;

  void showInnerContent(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Material(
          child: CommunityArticleCard(
            article: article,
          ),
        );
      },
    );
  }

  Widget buildNameIcon() {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          article.writerName.substring(0, 1),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildTag(String tagName) {
    Color backgroundColor = HSVColor.fromAHSV(
            1.0, Random(tagName.hashCode).nextDouble() * 360, 0.17, 0.99)
        .toColor();
    Color foregroundColor = HSVColor.fromAHSV(
            1.0,
            (Random(tagName.hashCode).nextDouble() + 0.08).abs() * 360,
            0.93,
            0.76)
        .toColor();
    return Container(
      height: 17,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: tagName.length > 2 ? 8 : 12,
        vertical: 2,
      ),
      child: Center(
        child: Text(
          "# $tagName",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF8F8F8),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            showInnerContent(context);
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Row(
              children: [
                Text(
                  "${index + 1}.",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF5E5E5E),
                  ),
                ),
                const SizedBox(width: 18),
                buildNameIcon(),
                const SizedBox(width: 14),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            article.title,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            ...article.tags.split("#").map((tag) {
                              if (tag.isEmpty) return Container();
                              return Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: buildTag(tag),
                              );
                            }).toList(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
