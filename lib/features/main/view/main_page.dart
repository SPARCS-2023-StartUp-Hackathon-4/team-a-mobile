import 'package:bloc_practice/features/bplan_repository/bplan_repository.dart';
import 'package:bloc_practice/features/community_repository/community_repository.dart';
import 'package:bloc_practice/features/main/pages/community/view/community_page.dart';
import 'package:bloc_practice/features/main/pages/home/view/home_page.dart';
import 'package:bloc_practice/features/main/pages/program/view/program_page.dart';
import 'package:bloc_practice/features/main/pages/trend/view/trend_page.dart';
import 'package:bloc_practice/features/main/widgets/main_appbar.dart';
import 'package:bloc_practice/features/main/widgets/main_bottom_navigation_bar.dart';
import 'package:bloc_practice/features/program_repository/program_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MainPage());
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    bPlanRepository = BPlanRepository();
    programRepository = ProgramRepository();
    communityRepository = CommunityRepository();
  }

  int index = 0;
  late final BPlanRepository bPlanRepository;
  late final ProgramRepository programRepository;
  late final CommunityRepository communityRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: bPlanRepository,
      child: RepositoryProvider.value(
        value: programRepository,
        child: RepositoryProvider.value(
          value: communityRepository,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  const MainAppBar(),
                  Expanded(
                    child: IndexedStack(
                      index: index,
                      children: const [
                        HomePage(),
                        CommunityPage(),
                        ProgramPage(),
                        TrendPage(),
                      ],
                    ),
                  ),
                  MainBottomNavigationBar(
                    index: index,
                    onTap: (index) {
                      setState(() {
                        this.index = index;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
