import 'package:flutter/material.dart';

class CommunityTabBar extends StatefulWidget {
  const CommunityTabBar({this.onTabChanged, Key? key}) : super(key: key);

  final void Function(int index)? onTabChanged;

  @override
  State<CommunityTabBar> createState() => _CommunityTabBarState();
}

class _CommunityTabBarState extends State<CommunityTabBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8),
      child: SizedBox(
        height: 40,
        child: TabBar(
          controller: _tabController,
          onTap: (index) {
            _tabController.index = index;
            widget.onTabChanged?.call(index);
          },
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          splashBorderRadius: BorderRadius.circular(20),
          indicator: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Color(0xFFEDEDED),
          ),
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          tabs: const [
            Tab(text: "전체"),
            Tab(text: "뉴스"),
            Tab(text: "자료"),
            Tab(text: "b-log")
          ],
        ),
      ),
    );
  }
}
