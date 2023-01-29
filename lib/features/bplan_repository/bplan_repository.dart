import 'package:bloc_practice/features/bplan_repository/models/bplan.dart';
import 'package:dio/dio.dart';

import '../../commons/api.dart';

class BPlanRepository {
  Future<BPlan?> getBPlan(String title) async {
    try {
      var response = await api.dio1.get(
        "bplan",
        queryParameters: {
          'title': title,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${await api.token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return BPlan.fromJson(response.data);
      }
    } catch (e) {
      print("error load BPlan");
      print(e);
    }

    return null;
  }

  Future<List<BPlan>> getBPlanList() async {
    try {
      var response = await api.dio1.get(
        "bplan/list",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${await api.token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data['BPlans'])
            .map((e) => BPlan.fromJson(e))
            .where((element) => !element.title.toLowerCase().contains("string"))
            .toList();
      }
    } catch (e) {
      print("eror load BPlan List");
      print(e);
    }

    return [];
  }
}
