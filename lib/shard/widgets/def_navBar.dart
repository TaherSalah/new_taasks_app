import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget defualtBottomNavigationBar({
  required List<GButton> tabs,
  required ValueChanged<int> onTabChange,
  required int currentIndex,
  required BuildContext context,
}) =>
    Container(
        child: GNav(
      haptic: true,
      tabBorder: Border.all(color: Colors.white),
      tabBorderRadius: 15,
      tabMargin: const EdgeInsets.symmetric(vertical: 15),
      tabShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)
      ],
      duration: const Duration(milliseconds: 500),
      gap: 16,
      onTabChange: onTabChange,
      selectedIndex: 0,
      backgroundColor: Colors.black,
      curve: Curves.linear,
      activeColor: Colors.amber,
      color: Colors.white,
      textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 16.0, color: Colors.amber, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18.5),
      tabs: tabs,
    ));
