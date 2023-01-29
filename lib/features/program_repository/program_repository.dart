import 'package:bloc_practice/features/bplan_repository/models/bplan.dart';
import 'package:bloc_practice/features/program_repository/models/program.dart';
import 'package:dio/dio.dart';

import '../../commons/api.dart';

class ProgramRepository {
  Future<BPlan?> getProgram(String title) async {
    try {
      var response = await api.dio2.get(
        "program",
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
      print("error load Program");
      print(e);
    }

    return null;
  }

  Future<List<Program>> getProgramList() async {
    try {
      var response = await api.dio2.get(
        "program/list",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${await api.token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data)
            .map((e) => Program.fromJson(e))
            .toList();
      }
    } catch (e) {
      print("error load Program List");
      print(e);
    }

    return [];
  }
}
