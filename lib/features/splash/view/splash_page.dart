import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Text(
                  '창업자를 위한 All-in-One 서비스',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFCBCBCB),
                  ),
                ),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                height: 48,
                "assets/resources/flit.svg",
                color: Colors.black,
                width: 2,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
