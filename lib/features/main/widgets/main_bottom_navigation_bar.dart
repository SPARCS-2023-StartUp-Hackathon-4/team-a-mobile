import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar(
      {required this.index, required this.onTap, Key? key})
      : super(key: key);

  final int index;

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight * 1.1,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFc2c2c2),
        currentIndex: index,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: "community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: "program"),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: "trend"),
        ],
      ),
    );
  }
}
