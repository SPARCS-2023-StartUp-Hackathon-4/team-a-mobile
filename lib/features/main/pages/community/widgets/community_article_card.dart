import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../community_repository/models/article.dart';

class CommunityArticleCard extends StatelessWidget {
  const CommunityArticleCard({this.onTap, required this.article, Key? key})
      : super(key: key);

  final Article article;

  final void Function()? onTap;

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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  children: [
                    buildNameIcon(),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              ...article.tags.split("#").map((e) {
                                if (e.isNotEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: buildTag(e),
                                  );
                                }
                                return Container();
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  article.content,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 36),
                Row(
                  children: [
                    // View Count
                    const Icon(
                      Icons.remove_red_eye,
                      size: 14,
                      color: Color(0xFF747474),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      article.viewCount.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF747474),
                      ),
                    ),
                    const SizedBox(width: 22),
                    // Like Count
                    const Icon(
                      Icons.favorite,
                      size: 14,
                      color: Color(0xFF747474),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      article.likeCount.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF747474),
                      ),
                    ),
                    const SizedBox(width: 22),
                    // Comment Count
                    const Icon(
                      Icons.comment,
                      size: 14,
                      color: Color(0xFF747474),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      article.commentCount.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF747474),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
