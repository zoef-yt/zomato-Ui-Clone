import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:zomato/main.dart';

class MyBottomBar extends StatefulWidget {
  final PageController controller;
  const MyBottomBar({Key? key, required this.controller}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black87,
      snakeViewColor: Colors.red,
      snakeShape: SnakeShape.indicator,
      currentIndex: selectedItemPosition,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (index) => setState(() {
        widget.controller.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
        selectedItemPosition = index;
      }),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Order'),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk), label: 'Go Out'),
        BottomNavigationBarItem(icon: Icon(Icons.star_border), label: 'Pro'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined), label: 'Donate'),
      ],
    );
  }
}
