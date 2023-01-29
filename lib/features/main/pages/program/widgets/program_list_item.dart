import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../../commons/constants.dart';

class ProgramListItem extends StatelessWidget {
  const ProgramListItem(
      {required this.title,
      required this.category,
      required this.applyPeriod,
      required this.organization,
      this.onTap,
      Key? key})
      : super(key: key);

  final String title;
  final String category;
  final String applyPeriod;
  final String organization;

  final void Function()? onTap;

  Tuple2<String, Color> _getPrefixIcon() {
    switch (category) {
      case '사업화':
        return const Tuple2('💸', Color(0x4403905a));
      case '멘토링·컨설팅':
        return const Tuple2('📢', Color(0x44030F90));
      case '창업교육':
        return const Tuple2('🎓', Color(0x44037ba0));
      case '시설ㆍ공간ㆍ보육':
        return const Tuple2('🛖', Color(0x44900303));
      case '행사ㆍ네트워크':
        return const Tuple2('🎉', Color(0x44a03f03));
      default:
        return const Tuple2('📌', Color(0x449ba003));
    }
  }

  Widget buildPrefixIcon() {
    final prefixIcon = _getPrefixIcon();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        color: prefixIcon.item2,
      ),
      width: 48,
      height: 48,
      alignment: Alignment.bottomCenter,
      child: Text(
        textAlign: TextAlign.center,
        prefixIcon.item1,
        style: const TextStyle(
          fontSize: 24,
          height: 2,
          fontFamily: 'tossface',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        ),
        padding: const EdgeInsets.all(4),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: Row(
          children: [
            buildPrefixIcon(),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          applyPeriod,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9aa6ac),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          organization,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9aa6ac),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
