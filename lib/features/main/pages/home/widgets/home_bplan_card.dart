import 'package:bloc_practice/app.dart';
import 'package:bloc_practice/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class HomeBPlanCard extends StatelessWidget {
  const HomeBPlanCard(
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
    return ScaleTap(
      onPressed: () {
        onTap?.call();
      },
      duration: const Duration(milliseconds: 200),
      scaleCurve: Curves.ease,
      scaleMinValue: 0.95,
      child: SizedBox(
        width: 180,
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(AppConstants.defaultBorderRadius),
            border: Border.all(
              color: const Color(0x88dde2e4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(12),
                spreadRadius: 1,
                blurRadius: 8.0,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppConstants.defaultBorderRadius),
                    topRight: Radius.circular(AppConstants.defaultBorderRadius),
                  ),
                  child: Image.network(
                    thumbnailUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 4,
                  ),
                  child: Column(
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
                      const SizedBox(height: 2),
                      Text(
                        "2022-01-${lastModified.toString()}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
