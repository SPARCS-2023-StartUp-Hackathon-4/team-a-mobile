import 'package:bloc_practice/commons/api.dart';
import 'package:bloc_practice/commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TrendPage extends StatefulWidget {
  const TrendPage({Key? key}) : super(key: key);

  @override
  State<TrendPage> createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  bool isLoading = true;
  List<Tuple2<int, String>> data = [];

  @override
  void initState() {
    try {
      api.dio1.get("trend").then((value) {
        setState(() {
          data = List<List<dynamic>>.from(value.data)
              .map((e) => Tuple2<int, String>(e[0], e[1]))
              .toList();
          isLoading = false;
        });
      });
    } catch (e) {
      print(e);
      print("error load trend data");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppConstants.defaultPadding),
            Row(
              children: [
                Text(
                  "9285 단어의",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " 데이터를 분석한",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "2022-01-29 의",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " 창업 트랜드는?",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: List.generate(
                      data.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${index}위",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "#${data[index].item2}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Text(
                              "-> ${data[index].item1}개의 키워드",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
