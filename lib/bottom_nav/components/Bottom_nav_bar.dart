import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  void Function(int)? onTabChange;

  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
        child: GNav(
          color: Colors.white,
          activeColor: Colors.white,
          gap: 8,
          curve: Curves.decelerate,
          rippleColor: Colors.black.withOpacity(.2),
          tabBackgroundColor: Colors.grey.shade800,
          mainAxisAlignment: MainAxisAlignment.center,
          haptic: true,
          tabBorderRadius: 40,
          onTabChange: (index) => widget.onTabChange!(index),
          tabs: const [
            GButton(
              iconSize: 18,
              padding: EdgeInsets.all(20),
              icon: Icons.note_add_sharp,
              text: "Notes",

              textStyle:
              TextStyle(fontStyle: FontStyle.normal, color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
            ),GButton(
              iconSize: 18,
              padding: EdgeInsets.all(20),
              icon: Icons.task_alt,
              text: "Todo\'s",
              textStyle:
              TextStyle(fontStyle: FontStyle.normal, color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

    );
  }
}
