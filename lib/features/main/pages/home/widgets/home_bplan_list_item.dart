import 'package:flutter/material.dart';

import '../../../../../commons/constants.dart';

class HomeBPlanListItem extends StatelessWidget {
  const HomeBPlanListItem(
      {required this.title,
      required this.thumbnailUrl,
      required this.lastModified,
      this.onTap,
      Key? key})
      : super(key: key);

  final String title;

  final String thumbnailUrl;

  final int lastModified;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        ),
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: onTap,
      child: SizedBox(
        height: 90,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppConstants.defaultBorderRadius),
            border: Border.all(
              style: BorderStyle.none,
              color: Colors.black.withAlpha(15),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppConstants.defaultBorderRadius,
                    ),
                    border: Border.all(
                      color: Color(0x88dde2e4),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultBorderRadius),
                    child: Image.network(
                      thumbnailUrl,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Version 1.0",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Last Modified 2022-01-${lastModified.toString()}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
