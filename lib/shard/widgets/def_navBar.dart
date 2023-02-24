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
      tabShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
      ],
      duration:const Duration(milliseconds: 900),
      gap: 16,
      onTabChange: onTabChange,
      selectedIndex: 0,
      backgroundColor: Colors.black,
      curve: Curves.linear,
      activeColor: Colors.amber,
      color: Colors.white,
      textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 16.0, color: Colors.amber, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12.5),
      tabs: tabs,
    ));
