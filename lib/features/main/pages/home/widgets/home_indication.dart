import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/constants.dart';
import '../../../../../widgets/animated_shimmer_switcher.dart';

class HomeIndication extends StatelessWidget {
  const HomeIndication({required this.shimmer, Key? key}) : super(key: key);

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
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              width: 100,
              height: 16,
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.circular(AppConstants.defaultBorderRadius),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Color> gradientColors = const [
    Colors.lightBlue,
    Colors.cyan,
  ];

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0x2237434d),
            dashArray: [5, 5],
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0x2237434d),
            dashArray: [5, 5],
            strokeWidth: 0.5,
          );
        },
      ),
      borderData: FlBorderData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                gradientColors[0].withAlpha(100),
                gradientColors[1].withAlpha(20),
              ],
            ),
          ),
        ),
      ],
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
              const Text(
                "업데이트된 지표",
                style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  letterSpacing: -0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius:
                      BorderRadius.circular(AppConstants.defaultBorderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(16),
                      spreadRadius: 1,
                      blurRadius: 8.0,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppConstants.defaultBorderRadius),
                      child: LineChart(
                        mainData(),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      left: 14,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(180),
                          borderRadius: BorderRadius.circular(
                              AppConstants.defaultBorderRadius),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "+12.0%",
                              style: TextStyle(
                                fontSize: 18,
                                height: 1,
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "사용자 증가율",
                              style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                letterSpacing: -0.8,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      left: 126,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(180),
                          borderRadius: BorderRadius.circular(
                              AppConstants.defaultBorderRadius),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "-8.2%",
                              style: TextStyle(
                                fontSize: 18,
                                height: 1,
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "새 사용자 수",
                              style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                letterSpacing: -0.8,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
